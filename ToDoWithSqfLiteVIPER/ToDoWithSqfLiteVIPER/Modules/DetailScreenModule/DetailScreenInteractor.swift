//
//  DetailScreenInteractor.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import Foundation

class DetailScrennInteractor: PresenterToInteractorDetailScreenProtocol {
   
    let db:FMDatabase?
    
    init(){
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    
    func updateTodo(todoId: Int, content: String ) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE Todo SET todoContent = ? WHERE todoId = ?", values: [content, todoId])
            
        } catch {
            print(error.localizedDescription)
        }
        
        db!.close()
    }
}
