//
//  AddScreenProtocols.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

protocol ViewToPresenterAddScreenProtocol {
    var interactor: PresenterToInteractorAddScreenProtocol? { get set }
    
    func saveTodo(content: String)
}

protocol PresenterToInteractorAddScreenProtocol {
    
    func saveTodo(content: String)
}

protocol PresenterToRouterAddScreenProtocol {
    static func createModule(ref: AddScreenViewController)
}
