//
//  DetailScreenProtocols.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation


protocol ViewToPresenterDetailScreenProtocol {
    var interactor: PresenterToInteractorDetailScreenProtocol? { get set }
    
    func updateTodo(todoId: Int, content: String)
}

protocol PresenterToInteractorDetailScreenProtocol {
    
    func updateTodo(todoId: Int, content: String)
}

protocol PresenterToRouterDetailScreenProtocol {
    static func createModule(ref: DetailScreenViewController)
}
