//
//  AddScreenInteractor.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class AddScrennInteractor: PresenterToInteractorAddScreenProtocol {
   
    let db:FMDatabase?
    
    init(){
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func saveTodo(content: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO Todo (todoContent) VALUES (?)", values: [content])
            
        } catch {
            print(error.localizedDescription)
        }
        
        db!.close()
    }
    
    
    
}
