//
//  EmailOtpViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 07/12/22.
//

import UIKit
import SJFrameSwift

class EmailOtpViewController: SJViewController {
    
    //MARK: -Outlets
    
    @IBOutlet weak var labelInOtp: UILabel!
    @IBOutlet weak var labelDidntReceiveEmail: UILabel!
    @IBOutlet weak var textFieldFirstNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldSecondNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldThirdNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldFourthNumberOfOtp: UITextField!
    
    //MARK: - Variables
    
    var color = #colorLiteral(red: 0.9533308148, green: 0.4192362428, blue: 0, alpha: 1)
    var receiveEmail: String!
    
    //MARK: - LifCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInOtp.text = "Please check your email "+"\(receiveEmail!)"+" continue to reset your password"
        textFieldFirstNumberOfOtp.addTarget(self, action: #selector(EmailOtpViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldSecondNumberOfOtp.addTarget(self, action: #selector(EmailOtpViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldThirdNumberOfOtp.addTarget(self, action: #selector(EmailOtpViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldFourthNumberOfOtp.addTarget(self, action: #selector(EmailOtpViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        setAttributedString()
        labelDidntReceiveEmail.textAlignment = .center
        self.labelDidntReceiveEmail.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.labelDidntReceiveEmail.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
    }
    
   //MARK: - ButtonAction
    
    @IBAction func buttonActionNext(sender: UIButton) {
        if (textFieldFirstNumberOfOtp.text != "" && textFieldSecondNumberOfOtp.text != "" && textFieldThirdNumberOfOtp.text != "" && textFieldFourthNumberOfOtp.text != "") {
            self.performSegue(withIdentifier: "NewPasswordViewController", sender: nil)
        }
    }
    
    //MARK: - AttributedString
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        let mainString = "Didn't Receive? Click Here"
        let string: NSMutableAttributedString = NSMutableAttributedString(string: mainString)
        let range1 = (mainString as NSString).range(of: "Click Here")
        string.setColorForText(textToFind:"Click Here", withColor: color)
        labelDidntReceiveEmail.attributedText = string
        if gesture.didTapAttributedTextLabel(label: self.labelDidntReceiveEmail, inRange: range1) {
            print("user tapped on Click Here")
           
        }
    }
    
    func setAttributedString() {
        let mainString = "Didn't Receive? Click Here"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let string: NSMutableAttributedString = NSMutableAttributedString(string: mainString)
        string.setColorForText(textToFind: "Click Here", withColor: color)
        string.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, string.length))
        labelDidntReceiveEmail.attributedText = string
    }
}

//MARK: - TextFieldDelegate

extension EmailOtpViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == textFieldFirstNumberOfOtp {
            if (textField.text?.count)! >= 1 {
                textFieldSecondNumberOfOtp.becomeFirstResponder()
            }
        }
        else if textField == textFieldSecondNumberOfOtp {
            if (textField.text?.count)! >= 1 {
                textFieldThirdNumberOfOtp.becomeFirstResponder()
            }
        }
        else if textField == textFieldThirdNumberOfOtp {
            if (textField.text?.count)! >= 1 {
                textFieldFourthNumberOfOtp.becomeFirstResponder()
            }
        }
        else if textField == textFieldFourthNumberOfOtp {
            if (textField.text?.count)! >= 1 {
                textFieldFourthNumberOfOtp.resignFirstResponder()
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}

