//
//  ViewController.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: ViewToPresenterMainScreenProtcol?
    
    var todoList = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        MainScreenRouter.createModule(ref: self)
        
        veritabaniKopyala()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getAllTodos()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let destVc = segue.destination as! DetailScreenViewController
            destVc.todo = sender as? Todo
        }
    }
    
    func veritabaniKopyala(){
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let toCopyPath = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: toCopyPath.path) {
            print("Veritabanı zaten var.")
        } else {
            
            do {
                
                try fm.copyItem(atPath: bundlePath!, toPath: toCopyPath.path)
                
            } catch {
                
                print(error.localizedDescription)
            }
        }
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        cell.todoContent.text = todoList[indexPath.row].todoContent
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todo = todoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            let todo = self.todoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "\(todo.todoContent!) will delete?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in }
            let yesAction = UIAlertAction(title: "Delete", style: .destructive){ action in
                self.presenter?.deleteTodo(todoId: todo.todoId!)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension MainScreenViewController: PresenterToViewMainScreenProtocol {
    func sendTodoListToView(todoList: [Todo]) {
        self.todoList = todoList
        self.todoTableView.reloadData()
    }
}

extension MainScreenViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTodo(searchText: searchText)
    }
}
