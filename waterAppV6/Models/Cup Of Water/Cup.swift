//
//  Cup.swift
//  waterAppV5
//
//  Created by Charlie on 12/31/19.
//  Copyright © 2019 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Cup : CupOfWaterSuperClass {
    
    //MARK: - Cup Methods
    override func loadImage() {
        //Graphics Renderer
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: graphicsWidth, height: graphicsHeight))
        
        //Drawing the image with Points
        let image = renderer.image { renderedImage in
            let img = renderedImage.cgContext
            
            //Drawing Lines to points
            img.move(to: cupPoints[0])
            img.addLine(to: cupPoints[1])
            img.addLine(to: cupPoints[2])
            img.addLine(to: cupPoints[3])
            
            //Setting Width of the lines
            img.setLineWidth(cupLineWidth)
            img.setStrokeColor(cupLineColor)
            
            //Draw the path provided
            img.strokePath()
        }
        
        self.image = image
    }
    
}
