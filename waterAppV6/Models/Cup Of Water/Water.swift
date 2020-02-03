//
//  Water.swift
//  waterAppV5
//
//  Created by Charlie on 12/31/19.
//  Copyright © 2019 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Water : CupOfWaterSuperClass {
    //MARK: - Cache References
    //let userData : UserDataController = UserDataController()

    //MARK: - Water Methods
        //LOAD IMAGE WITH DEFAULT USER VALUES
    override func loadImage() {

        let percent: Double = 0.50
        //let percent = userData.getPercentage()
        
        var topLeftPoint = waterPoints[0]
        var topRightPoint = waterPoints[3]
        
        topLeftPoint = getPointByPercent(percentage: percent, targetPoint: waterPoints[0], originPoint: waterPoints[1])
        topRightPoint = getPointByPercent(percentage: percent, targetPoint: waterPoints[3], originPoint: waterPoints[2])
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: graphicsWidth, height: graphicsHeight))

        //Drawing the image with Points
        let image = renderer.image { renderedImage in
            let img = renderedImage.cgContext

            //Drawing Lines to points
            img.move(to: topLeftPoint)
            img.addLine(to: waterPoints[1])
            img.addLine(to: waterPoints[2])
            img.addLine(to: topRightPoint)

            //Setting Color of the water
            img.setStrokeColor(waterStrokeColor)
            img.setFillColor(waterColor)

            //Draw the path provided
            img.drawPath(using: .fillStroke)
        }

        self.image = image
    }
    
    func getPointByPercent(percentage: Double, targetPoint: CGPoint, originPoint: CGPoint) -> CGPoint {
        let distance = CGPoint(x: targetPoint.x - originPoint.x, y: targetPoint.y - originPoint.y)
        let percentCalculation = CGPoint(x: distance.x * CGFloat(percentage), y: distance.y * CGFloat(percentage))
    
        let newPoint = CGPoint(x: originPoint.x + percentCalculation.x, y: originPoint.y + percentCalculation.y)
        return newPoint
    }
    
    //MARK: - Cup Methods
    func loadCup() {
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
