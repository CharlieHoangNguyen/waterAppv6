//
//  UserDataController.swift
//  waterAppV5
//
//  Created by Charlie on 1/2/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

struct UserDataController {
    //Variables
    let weightString : String = "User Weight"
    let weightMeasurement : String = "User Weight Measurement"
    let currentWaterString : String = "Current Water"
    let totalWaterString : String = "Total Water"
    let userNameString : String = "User Name"
    let lastDateString : String = "Last Accessed Date"
    let userAvatar : String = "User Avatar"
    let birthdayString : String = "User Birthday"
    let pushNotifsString : String = "User Notifications"
    let remindertimeString : String = "User Reminder Time"
    let waterMeasurementString : String = "User WaterMeasurement"
    
    let defaults = UserDefaults.standard
}

//MARK: - Percentage Methods
extension UserDataController {
    
    func getPercentage() -> Double {
        let percentage : Double = Double(getCurrentWater()) / Double(getTotalWater())
        return percentage
    }
}

//MARK: - Weight Methods
extension UserDataController {
    
    func setWeight(weight: Int) {
        defaults.set(weight, forKey: weightString)
    }
    
    func getWeight() -> Int {
        return defaults.integer(forKey: weightString)
    }
    
    func setWeightMeasurement(measurement: String) {
        defaults.set(weightMeasurement, forKey: measurement)
    }
    
    func getWeightMeasurement() -> String {
        return defaults.string(forKey: weightMeasurement) ?? "NO NAME"
    }
    
}

//MARK: - Water Intake Methods
extension UserDataController {
    
    func resetCurrentWater() {
        defaults.set(0, forKey: currentWaterString)
    }
    
    func setCurrentWater(waterAmount: Int) {
        var waterIntake = defaults.integer(forKey: currentWaterString)
        waterIntake += waterAmount
        defaults.set(waterIntake, forKey: currentWaterString)
    }
    
    func getCurrentWater() -> Int {
        return defaults.integer(forKey: currentWaterString)
    }
    
}

//MARK: - Total Water Methods
extension UserDataController {
    
    func setTotalWater() {
        // TODO: MAKE A METHOD THAT CALCULATES THE
        // DAILY WATER INTAKE
        // FOR NOW USE THE OLD METHOD
        let expectedWater = 100
        defaults.set(expectedWater, forKey: totalWaterString)
    }
    
    func getTotalWater() -> Int {
        return defaults.integer(forKey: totalWaterString)
    }
    
}

//MARK: - User's Name Method
extension UserDataController {
    
    func updateName(name: String) {
        defaults.set(name, forKey: userNameString)
    }
    
    func getName() -> String {
        if let userName = defaults.string(forKey: userNameString) {
            return userName
        } else {
            return ""
        }
    }
}

//MARK: - User's Avatar Method
extension UserDataController {
    func updateAvatar(image: UIImage) {
        defaults.set(image, forKey: userAvatar)
    }
    
    func getAvatar() -> UIImage {
        return defaults.object(forKey: userAvatar) as! UIImage
    }
}

//MARK: - Time & Date Methods
extension UserDataController {
    
    func setCurrentDate(date: Date) {
        defaults.set(date, forKey: lastDateString)
    }
    
    func getLastDate() -> Date {
        return defaults.object(forKey: lastDateString) as! Date
    }
    
    func setBirthday(birthday: Date) {
        defaults.set(birthday, forKey: birthdayString)
    }
    
    func getBirthday() -> Date {
        return defaults.object(forKey: birthdayString) as! Date
    }
    
    func setRemindertime(time: Date) {
        defaults.set(time, forKey: remindertimeString)
    }
    
    func getReminderTime() -> Date {
        return defaults.object(forKey: remindertimeString) as! Date
    }
}

//MARK: - Push Notificaions Methods
extension UserDataController {
    func changePushNotificationsState(state: Bool) {
        defaults.set(state, forKey: pushNotifsString)
    }
    
    func getCurrentPushNotifState() -> Bool {
        return defaults.bool(forKey: pushNotifsString)
    }
}

//MARK: - User Water Measurement
extension UserDataController {
    func setWaterMeasurement(measurement: String) {
        defaults.set(measurement, forKey: waterMeasurementString)
    }
    
    func getWaterMeasurement() -> String {
        return defaults.string(forKey: waterMeasurementString) ?? ""
    }
}
