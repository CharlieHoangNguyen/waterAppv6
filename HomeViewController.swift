//
//  ViewController.swift
//  waterAppV6
//
//  Created by Charlie on 2/2/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var cup: Cup!
    @IBOutlet weak var water: Water!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cup.loadImage()
        water.loadImage()
    }


}

