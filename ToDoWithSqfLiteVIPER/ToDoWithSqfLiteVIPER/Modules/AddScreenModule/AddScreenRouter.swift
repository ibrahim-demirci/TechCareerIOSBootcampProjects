//
//  AddScreenRouter.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class AddScreenRouter: PresenterToRouterAddScreenProtocol {
    
    static func createModule(ref: AddScreenViewController) {
        
        ref.presenter = AddScreenPresenter()
        
        ref.presenter?.interactor = AddScrennInteractor()
    }
    
    
}
