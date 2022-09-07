//
//  AddScreenViewController.swift
//  ToDoWithSqfLiteVIPER
//
//  Created by İbrahim on 7.09.2022.
//

import UIKit

class AddScreenViewController: UIViewController {
    
    @IBOutlet weak var todoContentTextField: UITextField!
    
    var presenter: ViewToPresenterAddScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddScreenRouter.createModule(ref: self)

    }
    
    @IBAction func addClicked(_ sender: Any) {
        
        if let content = todoContentTextField.text , !content.isEmpty {
            presenter?.saveTodo(content: content)
        }
    }
}
