//
//  SettingsViewController.swift
//  waterAppV6
//
//  Created by Charlie on 2/9/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - Cache References
    let userData = UserDataController()
    
    //MARK: - IBOutlets
    @IBOutlet weak var pushNotifsSwitch: UISwitch!
    
    override func viewDidLoad() {
        getNotifState()
    }
    
    //MARK: - IBActions
    @IBAction func changeNotifState(_ sender: UISwitch) {
        userData.changePushNotificationsState(state: sender.isOn)
    }
}

//MARK: - Push Notifications Methods
extension SettingsViewController {
    func getNotifState() {
        pushNotifsSwitch.isOn = userData.getCurrentPushNotifState()
    }
    
    
}
