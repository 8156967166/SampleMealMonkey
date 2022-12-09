//
//  ViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 05/12/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var viewArc: UIView!
    @IBOutlet weak var labelMealMonkey: UILabel!
    
    //MARK: - Variables
    
    var color = #colorLiteral(red: 0.9882352941, green: 0.3764705882, blue: 0.06666666667, alpha: 1)
    
    //MARK: - LifeCycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setArc()
        setColorLabel()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    func setArc() {
        let shapeLayer = CAShapeLayer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            shapeLayer.frame = self.viewArc.bounds
            let rect = CGRect(x:0, y:0, width:self.viewArc.frame.size.width, height: self.viewArc.frame.size.height)
            let cornerRadius:CGFloat = 20
            let subPathSideSize:CGFloat = self.viewArc.frame.size.width / 2
            let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            let bottomSubPath = UIBezierPath(arcCenter: CGPoint(x: rect.width / 2 , y: rect.height ),
                                             radius: subPathSideSize / 2 , startAngle: .pi, endAngle: 0, clockwise: true)
            path.append(bottomSubPath.reversing())
            let mask = CAShapeLayer()
            mask.frame = shapeLayer.bounds
            mask.path = path.cgPath
            self.viewArc.layer.mask = mask
        }
    }
    
    func setColorLabel() {
        let mainStrings = "Meal Monkey"
        let stringToColors = "Meal"
        let ranges = (mainStrings as NSString).range(of: stringToColors)

        let mutableAttributedStrings = NSMutableAttributedString.init(string: mainStrings)
        mutableAttributedStrings.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: ranges)
        labelMealMonkey.attributedText = mutableAttributedStrings
    }
    
    //MARK: - ButtonActions
    
    @IBAction func buttonActionLogin(sender: UIButton) {
        self.performSegue(withIdentifier: "LoginViewController", sender: nil)
    }
    
    @IBAction func buttonActionCreateAccount(sender: UIButton) {
        self.performSegue(withIdentifier: "SingUpViewController", sender: nil)
    }
}

