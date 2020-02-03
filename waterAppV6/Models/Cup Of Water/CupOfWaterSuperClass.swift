//
//  CupOfWaterSuperClass.swift
//  waterAppV5
//
//  Created by Charlie on 1/2/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

class CupOfWaterSuperClass: UIImageView {
    
    //MARK: - Graphics Variables
    let graphicsWidth : Int = 250
    let graphicsHeight : Int = 250
    
    //MARK: - Cup Variables
    //Cup Points
    let cupPoints : [CGPoint] =
        [CGPoint(x: 50, y: 0), //Top Left Point
         CGPoint(x: 80, y: 200), //Bottom Left Point
         CGPoint(x: 170, y: 200),//Bottom Right Point
         CGPoint(x: 200, y: 0)] //Top Right Point
    //Cup Line Width
    let cupLineWidth : CGFloat = 5
    //Cup Line Color
    let cupLineColor : CGColor = UIColor.black.cgColor
    
    
    //MARK: - Water Variables
    var waterPoints : [CGPoint] =
        [CGPoint(x: 55, y: 0), //Top Left Point
         CGPoint(x: 85, y: 195), //Bottom Left Point
         CGPoint(x: 165, y: 195),//Bottom Right Point
         CGPoint(x: 195, y: 0)] //Top Right Point]
    
    let waterColor : CGColor = UIColor.blue.cgColor
    let waterStrokeColor : CGColor = UIColor.clear.cgColor

    //MARK: - Load Image Method
    func loadImage() {
        
    }
    
}

