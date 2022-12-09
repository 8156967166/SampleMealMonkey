//
//  SingUpViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 06/12/22.
//

import UIKit

class SingUpViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var labelAlreadyHaveAnAccountLogin: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldMobileNumber: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var viewNameError: UIView!
    @IBOutlet weak var viewEmailError: UIView!
    @IBOutlet weak var viewMobileNumberError: UIView!
    @IBOutlet weak var viewAddressError: UIView!
    @IBOutlet weak var viewPasswordError: UIView!
    @IBOutlet weak var viewConfirmPasswordsError: UIView!
    @IBOutlet weak var labelConfirmPasswordsError: UILabel!
    
    //MARK: - Variables
    
    var validation = Validation()
    var color = #colorLiteral(red: 0.9533308148, green: 0.4192362428, blue: 0, alpha: 1)
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNameError.isHidden = true
        viewEmailError.isHidden = true
        viewMobileNumberError.isHidden = true
        viewAddressError.isHidden = true
        viewAddressError.isHidden = true
        viewPasswordError.isHidden = true
        viewConfirmPasswordsError.isHidden = true
        setAttributedString()
        labelAlreadyHaveAnAccountLogin.textAlignment = .center
        self.labelAlreadyHaveAnAccountLogin.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.labelAlreadyHaveAnAccountLogin.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
    }

    //MARK: - AttributedString
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        let mainString = "Already have an Account? Login"
        let string: NSMutableAttributedString = NSMutableAttributedString(string: mainString)
        let range1 = (mainString as NSString).range(of: "Login")
        string.setColorForText(textToFind: "Login", withColor: color)
        labelAlreadyHaveAnAccountLogin.attributedText = string
        if gesture.didTapAttributedTextLabel(label: self.labelAlreadyHaveAnAccountLogin, inRange: range1) {
            print("user tapped on Login")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setAttributedString() {
        let mainString = "Already have an Account? Login"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let string: NSMutableAttributedString = NSMutableAttributedString(string: mainString)
        string.setColorForText(textToFind: "Login", withColor: color)
        string.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, string.length))
        labelAlreadyHaveAnAccountLogin.attributedText = string
    }
    
    //MARK: - ButtonActions
    
    @IBAction func buttonActionBack(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonActionSignUp(sender: UIButton) {
        guard let email = textFieldEmail.text, let phone = textFieldMobileNumber.text
        else {
            return
        }
        if textFieldName.text?.isEmpty == true {
            viewNameError.isHidden = false
        }
        else {
            viewNameError.isHidden = true
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if(isValidateEmail == false) {
            viewEmailError.isHidden = false
        }
        else {
            viewEmailError.isHidden = true
        }
        let isValidateMobile = self.validation.validatePhoneNumber(phoneNumber: phone)
        if(isValidateMobile == false) {
            viewMobileNumberError.isHidden = false
        }
        else {
            viewMobileNumberError.isHidden = true
        }
        if textFieldAddress.text?.isEmpty == true {
            viewAddressError.isHidden = false
        }
        else {
            viewAddressError.isHidden = true
        }
        if textFieldPassword.text?.isEmpty == true {
            viewPasswordError.isHidden = false
        }
        else {
            viewPasswordError.isHidden = true
        }
        if textFieldConfirmPassword.text?.isEmpty == true {
            viewConfirmPasswordsError.isHidden = false
        }
        else {
            if textFieldPassword.text == textFieldConfirmPassword.text {
                viewConfirmPasswordsError.isHidden = true
            }
            else {
                labelConfirmPasswordsError.text = "Password don't match"
            }
        }
        if (isValidateEmail == true && isValidateMobile == true && textFieldName.text != "" && textFieldPassword.text != "" && textFieldAddress.text != "" && textFieldPassword.text != "" && textFieldConfirmPassword.text != "") {
            if textFieldPassword.text == textFieldConfirmPassword.text {
                self.performSegue(withIdentifier: "MobileOtpViewController", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MobileOtpViewController
        vc.receivePhoneNumber = textFieldMobileNumber.text
    }
}


