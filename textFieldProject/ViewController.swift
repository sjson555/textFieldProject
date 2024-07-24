//
//  ViewController.swift
//  textFieldProject
//
//  Created by 손성준 on 7/23/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 텍스트필드 내부의 delegate라는 속성이 있음
        // 대리자(ViewController)를 설정해주는 것
        textField.delegate = self
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
    
    // 텍스트필드의 입력을 시작할때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점 - 텍스트필드의 입력이 시작 됨
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 텍스트필드 클리어 버튼 사용할지 말지의 여부 허락하는 것
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print(string)
        return true
    }
    
    // 텍스트필드 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textField.text == "" {
            textField.placeholder = "Type Something!!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날때 호출 (끝날지 말지 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점- 텍스트필드의 입력이 실제 끝났을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 끝냈다.")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }

}

