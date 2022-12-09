//
//  LoginViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 06/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var labelDontHaveAnAccountSignUp: UILabel!
    @IBOutlet weak var textFieldEmailLogin: UITextField!
    @IBOutlet weak var viewEmailLoginError: UIView!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var viewPasswordError: UIView!
    
    //MARK: - Variables
    var validation = Validation()
    var color = #colorLiteral(red: 0.9533308148, green: 0.4192362428, blue: 0, alpha: 1)
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEmailLoginError.isHidden = true
        viewPasswordError.isHidden = true
        setAttributedString()
        labelDontHaveAnAccountSignUp.textAlignment = .center
        self.labelDontHaveAnAccountSignUp.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.labelDontHaveAnAccountSignUp.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
    }
    
    //MARK: - AttributedString
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        let mainString = "Don't have an Account? Sign Up"
        let string: NSMutableAttributedString = NSMutableAttributedString(string: mainString)
        let range1 = (mainString as NSString).range(of: "Sign Up")
        string.setColorForText(textToFind:"Sign Up", withColor: color)
        labelDontHaveAnAccountSignUp.attributedText = string
        if gesture.didTapAttributedTextLabel(label: self.labelDontHaveAnAccountSignUp, inRange: range1) {
            print("user tapped on Sign Up")
            self.performSegue(withIdentifier: "SingUpViewController", sender: nil)
        }
    }
    
    func setAttributedString() {
        let mainString = "Don't have an Account? Sign Up"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let string: NSMutableAttributedString = NSMutableAttributedString(string: mainString)
        string.setColorForText(textToFind: "Sign Up", withColor: color)
        string.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, string.length))
        labelDontHaveAnAccountSignUp.attributedText = string
    }
    
    //MARK: - ButtonActions
    
    @IBAction func buttonActionForgotPassword(sender: UIButton) {
        self.performSegue(withIdentifier: "ResetPasswordViewController", sender: nil)
    }
    
    @IBAction func buttonActionBack(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonActionLogin(sender: UIButton) {
        guard let email = textFieldEmailLogin.text
        else {
            return
        }
        
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if(isValidateEmail == false) {
            viewEmailLoginError.isHidden = false
        }
        else {
            viewEmailLoginError.isHidden = true
        }
        if textFieldPassword.text?.isEmpty == true {
            viewPasswordError.isHidden = false
        }
        else {
            viewPasswordError.isHidden = true
        }
    }
    
}
