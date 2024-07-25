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
        // 텍스트필드 내부에 delegate라는 속성이 있음
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
        // textField가 First응답 객체가 됨 (키보드 올라옴)
        textField.becomeFirstResponder()
    }
    
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // textField.resignFirstResponder()
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
//        print(#function)
//        print(string)
        // 글자수 제한 - 1
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        // 글자수 제한 - 2 (숫자인경우 입력 허용하지 않음)
//        if Int(string) != nil { // (숫자로 변환이 된다면  nil이 아닐테니!)
//            return false
//        } else {
//            guard let text = textField.text else { return true }
//            let newLength = text.count + string.count - range.length
//            return newLength <= 10
//        }
        // 글자수 제한 - 3
        if (textField.text?.count)! + string.count > 10 {
            return false
        } else {
            return true
        }
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
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 키보드 내려감
        textField.resignFirstResponder()
    }

}

