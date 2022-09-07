//
//  MainScreenPresenter.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class MainScreenPresenter: ViewToPresenterMainScreenProtcol {
    
    
    var interactor: PresenterToInteractorMainScreenProtocol?
    
    var view: PresenterToViewMainScreenProtocol?
    
    func getAllTodos() {
        interactor?.getAllTodos()
    }
    
    func searchTodo(searchText: String) {
        interactor?.searchTodo(searchText: searchText)
    }
    
    func deleteTodo(todoId: Int) {
        interactor?.deleteTodo(todoId: todoId)
    }
    
}

extension MainScreenPresenter: InteractorToPresenterMainScreenProtocol {
    func sendTodoListToPresenter(todoList: [Todo]) {
        view?.sendTodoListToView(todoList: todoList)

    }
}
