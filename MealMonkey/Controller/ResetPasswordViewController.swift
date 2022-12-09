//
//  ResetPasswordViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 06/12/22.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var viewEmailError: UIView!
    
    //MARK: - Variables
    
    var validation = Validation()
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEmailError.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ButtonACtions
    
    @IBAction func buttonActionBack(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonActionSend(sender: UIButton) {
        guard let email = textFieldEmail.text
        else {
            return
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if(isValidateEmail == false) {
            viewEmailError.isHidden = false
        }
        if isValidateEmail == true {
            viewEmailError.isHidden = true
            self.performSegue(withIdentifier: "EmailOtpViewController", sender: nil)
        }
    }
    
    //MARK: - DataPassToNextVc
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EmailOtpViewController
        vc.receiveEmail = textFieldEmail.text
    }
    
}
