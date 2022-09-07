//
//  DetailScreenViewController.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import UIKit

class DetailScreenViewController: UIViewController {

    @IBOutlet weak var contentTextField: UITextField!
    
    var presenter: DetailScreenPresenter?
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo, let content = todo.todoContent{
            contentTextField.text = content
        }
        
        DetailScreenRouter.createModule(ref: self)

    }
    
    @IBAction func updateClicked(_ sender: Any) {
        
        if let content = contentTextField.text , !content.isEmpty, let todoId = todo?.todoId {
            presenter?.updateTodo(todoId: todoId, content: content)
        }
    }
}
