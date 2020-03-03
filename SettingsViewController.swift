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
    var datePicker: UIDatePicker!
    var measurementPicker: UIPickerView!
    
    let measurementUnits: [String] = ["Milimeters", "Ounces"]
    
    //MARK: - IBOutlets
    @IBOutlet weak var pushNotifsSwitch: UISwitch!
    @IBOutlet weak var reminderTimeTextField: UITextField!
    @IBOutlet weak var waterMeasurementTextField: UITextField!
    
    override func viewDidLoad() {
        getNotifState()
        reminderTimeTextField.delegate = self
        waterMeasurementTextField.delegate = self
        //measurementPicker.dataSource = self
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

//MARK: - Change Reminder Time Methods
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.tag == 0) {
            self.changeReminderTime(textField)
        } else if(textField.tag == 1) {
            self.changeMeasurementUnit(textField)
        }
        
    }
    func changeReminderTime(_ textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePicker.Mode.time
        textField.inputView = self.datePicker

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonReminderTimeAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonReminderTimeAction() {
        let newReminderTime = datePicker.date
        userData.setRemindertime(time: newReminderTime)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        let newReminderTimeString = dateFormatter.string(from: newReminderTime)
        
        reminderTimeTextField.text = newReminderTimeString
        self.view.endEditing(true)
    }

}

//MARK: - Change Measurement Unit Methods
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return measurementUnits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return measurementUnits[row]
    }
    

    
    func changeMeasurementUnit(_ textField: UITextField) {
        //UIPickerView
        self.measurementPicker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.measurementPicker.backgroundColor = UIColor.white
        self.measurementPicker.delegate = self
        self.measurementPicker.dataSource = self
        textField.inputView = self.measurementPicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonMeasurementAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonMeasurementAction() {
        let newMeasurementIndex = measurementPicker.selectedRow(inComponent: 0)
        userData.setWaterMeasurement(measurement: measurementUnits[newMeasurementIndex])
        waterMeasurementTextField.text = userData.getWaterMeasurement()
        self.view.endEditing(true)
    }
}
