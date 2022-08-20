//
//  YViewController.swift
//  Homework4
//
//  Created by İbrahim on 20.08.2022.
//

import UIKit

class YViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateRoot(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
