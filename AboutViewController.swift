//
//  AboutViewController.swift
//  waterAppV6
//
//  Created by Charlie on 2/17/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var versionNumberLabel: UILabel!
    @IBOutlet weak var buildNumberLabel: UILabel!
    
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionNumberLabel.text = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        buildNumberLabel.text = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
