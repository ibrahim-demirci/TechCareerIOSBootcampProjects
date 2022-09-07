//
//  DetailScreenPresenter.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class DetailScreenPresenter: ViewToPresenterDetailScreenProtocol {
    
    var interactor: PresenterToInteractorDetailScreenProtocol?
    
    func updateTodo(todoId: Int, content: String) {
        interactor?.updateTodo(todoId: todoId, content: content)
    }
    
}
