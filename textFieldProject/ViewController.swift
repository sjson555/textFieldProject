//
//  ViewController.swift
//  textFieldProject
//
//  Created by 손성준 on 7/23/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        view.backgroundColor = UIColor.gray
        // ⌥ + 클릭을 생활화 하면 좋음!
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }

}

