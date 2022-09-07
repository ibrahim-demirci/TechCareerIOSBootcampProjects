//
//  DetailScreenRouter.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class DetailScreenRouter: PresenterToRouterDetailScreenProtocol {
    
    static func createModule(ref: DetailScreenViewController) {
        
        ref.presenter = DetailScreenPresenter()
        
        ref.presenter?.interactor = DetailScrennInteractor()
    }
    
}
