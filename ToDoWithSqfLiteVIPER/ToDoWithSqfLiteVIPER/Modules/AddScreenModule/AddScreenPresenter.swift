//
//  AddScreenPresenter.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class AddScreenPresenter: ViewToPresenterAddScreenProtocol {
    
    var interactor: PresenterToInteractorAddScreenProtocol?
    
    func saveTodo(content: String) {
        interactor?.saveTodo(content: content)
    }
    
}
