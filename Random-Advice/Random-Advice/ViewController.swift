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
    @IBOutlet weak var adviceButton: UIButton!
    let baseURL = "http://api.adviceslip.com/advice"
    var nextAdvice:String = ""
    let colors = ColorProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let chosenColor = colors.getRandomColor()
        
        Alamofire.request(baseURL).responseJSON { (responseData) -> Void in if((responseData.result.value) != nil) {
            let swiftyJsonVar = JSON(responseData.result.value!)
            
            //self.advice = swiftyJsonVar["slip"]["advice"].string!
            self.adviceLabel.text = swiftyJsonVar["slip"]["advice"].string!
            }
        }
        getAdvice()
        
        self.view.backgroundColor = chosenColor
        self.adviceButton.tintColor = chosenColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAdvice() -> () {

        Alamofire.request(baseURL).responseJSON { (responseData) -> Void in if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
            
                //self.advice = swiftyJsonVar["slip"]["advice"].string!
                self.nextAdvice = swiftyJsonVar["slip"]["advice"].string!
            }
        }
    }
    
    @IBAction func showAnotherAdvice(_ sender: Any) {
        // Modify the adviceLabel with a random advice.
        let chosenColor = colors.getRandomColor()
        
        self.adviceLabel.text = nextAdvice
        getAdvice()
        
        self.view.backgroundColor = chosenColor
        self.adviceButton.tintColor = chosenColor
    }
    
    
}

