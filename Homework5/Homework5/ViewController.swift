//
//  ViewController.swift
//  Homework5
//
//  Created by İbrahim on 27.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var sum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clicked(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 1:
            textField.text = textField.text! + "1"
        case 2:
            textField.text = textField.text! + "2"
        case 3:
            textField.text = textField.text! + "3"
        case 4:
            textField.text = textField.text! + "4"
        case 5:
            textField.text = textField.text! + "5"
        case 6:
            textField.text = textField.text! + "6"
        case 7:
            textField.text = textField.text! + "7"
        case 8:
            textField.text = textField.text! + "8"
        case 9:
            textField.text = textField.text! + "9"
        case 10:
            textField.text = ""
        case 11:
            if textField.text != "" && textField.text!.last != "+" {
                textField.text = textField.text! + "+"
            }
        case 12:
            if textField.text != "" {
                calculateSum()
            }
        default:
            print("unknown")
        }
    }
    
    func calculateSum() {
        var numbers = textField.text!.components(separatedBy: "+")
        for num in numbers {
            sum = sum + Int(num)!
        }
        textField.text = "\(sum)"
        sum = 0
    }
    
}

