//
//  NewPasswordViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 07/12/22.
//

import UIKit

class NewPasswordViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var textFieldNewPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var viewConfirmError: UIView!
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfirmError.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Alert
    
    func showAlert(strTitle: String, strMessage: String) {
        let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            if let viewController = self.navigationController?.viewControllers.first(where: {$0 is LoginViewController}) {
                self.navigationController?.popToViewController(viewController, animated: false)
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - ButtonAction
    
    @IBAction func buttonActionNext(sender: UIButton) {
        if textFieldNewPassword.text == textFieldConfirmPassword.text {
            viewConfirmError.isHidden = true
            showAlert(strTitle: "Password Changed!", strMessage: "your password has been Changed successfully")
        }
        else {
            viewConfirmError.isHidden = false
        }
    }

}
