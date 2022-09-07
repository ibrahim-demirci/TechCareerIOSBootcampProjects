//
//  MainScreenInteractor.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class MainScreenInteractor: PresenterToInteractorMainScreenProtocol {
    var presenter: InteractorToPresenterMainScreenProtocol?
    
    let db:FMDatabase?
    
    init(){
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func getAllTodos() {
        var todoList = [Todo]()
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM Todo", values: nil)
            
            while q.next() {
                let todo = Todo(todoId: Int(q.string(forColumn: "todoId"))!, todoContent: q.string(forColumn: "todoContent")!)
                todoList.append(todo)
            }
            
            presenter?.sendTodoListToPresenter(todoList: todoList)

        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    func searchTodo(searchText: String) {
        var todoList = [Todo]()
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM Todo WHERE todoContent LIKE '%\(searchText)%'", values: nil)
            
            while q.next() {
                let todo = Todo(todoId: Int(q.string(forColumn: "todoId"))!, todoContent: q.string(forColumn: "todoContent")!)
                todoList.append(todo)
            }
            
            presenter?.sendTodoListToPresenter(todoList: todoList)

        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    func deleteTodo(todoId: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM Todo WHERE todoId = ?", values: [todoId])
            getAllTodos()
            
        } catch {
            print(error.localizedDescription)
        }
        
        db!.close()
    }
}
