//
//  MainScreenProtocols.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

protocol ViewToPresenterMainScreenProtcol {
    
    var interactor: PresenterToInteractorMainScreenProtocol? { get set }
    var view: PresenterToViewMainScreenProtocol? { get set }
    
    func getAllTodos()
    
    func searchTodo(searchText: String)
    
    func deleteTodo(todoId: Int)
    
}

protocol PresenterToInteractorMainScreenProtocol {
    
    var presenter: InteractorToPresenterMainScreenProtocol? { get set }
    
    func getAllTodos()
    
    func searchTodo(searchText: String)
    
    func deleteTodo(todoId: Int)


}

protocol InteractorToPresenterMainScreenProtocol {
    
    func sendTodoListToPresenter(todoList: [Todo])
}

protocol PresenterToViewMainScreenProtocol {
    
    func sendTodoListToView(todoList: [Todo])

}

protocol PresenterToRouterMainScreenProtocol {
    
    static func createModule(ref: MainScreenViewController)
    
}
