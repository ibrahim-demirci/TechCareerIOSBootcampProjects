//
//  MainScreenRouter.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class MainScreenRouter: PresenterToRouterMainScreenProtocol {
    
    static func createModule(ref: MainScreenViewController) {
        
        let presenter =  MainScreenPresenter()
        
        ref.presenter = presenter
        ref.presenter?.interactor = MainScreenInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
}
