//
//  FindFoodViewController.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 08/12/22.
//

import UIKit

class FindFoodViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var imageDelivery: UIImageView!
    
    //MARK: - Variables
    
    var currentPage = 0
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    func updatePageController() {
        pageControl.currentPage = currentPage
    }
    
    //MARK: - ButtonActions
    
    @IBAction func buttonActionNext(sender: UIButton) {
        if currentPage == 0  {
            print("currentPage --- \(currentPage)")
            currentPage += 1
            labelTitle.text = "Fast Delivery"
            labelSubTitle.text = "Fast food delivery to your home, office wherever you are"
            imageDelivery.image = UIImage(named: "Deliveryvector")
            updatePageController()
        }
        else if currentPage == 1 {
            print("currentPage --- \(currentPage)")
            currentPage += 1
            labelTitle.text = "Live Tracking"
            labelSubTitle.text = "Real time tracking of your food on the app once you placed the order"
            imageDelivery.image = UIImage(named: "Livetrackingvector")
            updatePageController()
        }
        else if currentPage == 2 {
            self.performSegue(withIdentifier: "DeliveryViewController", sender: nil)
            print("currentPage --- \(currentPage)")
        }
    }
}
