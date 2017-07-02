//
//  ViewController.swift
//  Random-Advice
//
//  Created by CheckoutUser on 7/1/17.
//  Copyright © 2017 Anand_Batjargal. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var adviceLabel: UILabel!
    let baseURL = "http://api.adviceslip.com/advice"
    var advice:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(baseURL).responseJSON { (responseData) -> Void in if((responseData.result.value) != nil) {
            let swiftyJsonVar = JSON(responseData.result.value!)
            
            //print(swiftyJsonVar["slip"]["advice"].string!)
            self.adviceLabel.text = swiftyJsonVar["slip"]["advice"].string!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAdvice() -> () {

        Alamofire.request(baseURL).responseJSON { (responseData) -> Void in if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                //print(swiftyJsonVar["slip"]["advice"].string!)
                self.advice = swiftyJsonVar["slip"]["advice"].string!
            }
        }
    }

    func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func showAnotherAdvice(_ sender: Any) {
        // Modify the adviceLabel with a random advice.
        getAdvice()
        adviceLabel.text = advice
        self.view.backgroundColor = randomColor()
    }
    
    
}

