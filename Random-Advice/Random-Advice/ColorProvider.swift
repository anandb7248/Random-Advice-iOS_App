//
//  ColorProvider.swift
//  Random-Advice
//
//  Created by CheckoutUser on 7/2/17.
//  Copyright © 2017 Anand_Batjargal. All rights reserved.
//

import UIKit

struct ColorProvider {
    let colors = [
        UIColor(red: 0/255.0, green: 25/255.0, blue: 255/255.0, alpha: 1), //Blue,
        UIColor(red: 255/255.0, green: 0/255.0, blue: 255/255.0, alpha: 1), //Purple,
        UIColor(red: 186/255.0, green: 40/255.0, blue: 48/255.0, alpha: 1), //Red
        UIColor(red: 48/255.0, green: 186/255.0, blue: 12/255.0, alpha: 1), //Green
        UIColor(red: 255/255.0, green: 34/255.0, blue: 143/255.0, alpha: 1), //Pink
        UIColor(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1), //Orange
        UIColor(red: 255/255.0, green: 197/255.0, blue: 32/255.0, alpha: 1) // Yellow
    
    ]
    
    func getRandomColor() -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(colors.count)))]
    }
}
