//
//  AccountViewController.swift
//  waterAppV6
//
//  Created by Charlie on 2/9/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import Foundation
import UIKit

class AccountViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightMeasurement: UILabel!
    @IBOutlet weak var heightTextField: UILabel!
    @IBOutlet weak var BirthdayTextField: UILabel!
    
    //MARK: - Cache References
    let userData = UserDataController()
    
    override func viewDidLoad() {
        setDelegates()
        getName()
        getWeight()
    }
    
}

//MARK: - TextField Delegates
extension AccountViewController {
    func setDelegates() {
        self.nameTextField.delegate = self
        self.weightTextField.delegate = self
    }
}

//MARK: - getUserData Methods
extension AccountViewController {
    func getName() {
        nameTextField.text = userData.getName()
        nameTextField.returnKeyType = .done
    }
    
    func getWeight() {
        weightTextField.text = "\(userData.getWeight())"
        weightTextField.keyboardType = .numberPad
        addDoneButtonOnKeyboard()
    }
    
    func getWeightMeasurement() {
        weightMeasurement.text = "\(userData.getWeightMeasurement())"
    }
}

//MARK: - setUserData Methods
extension AccountViewController {
    func setName() {
        userData.updateName(name: nameTextField.text ?? "NO NAME")
    }
    func setWeight() {
        if let weight = weightTextField {
            userData.setWeight(weight: Int(weight.text ?? "0") ?? 0)
        }
    }
}

//MARK: - keyboard Methods
extension AccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setName()
        self.view.endEditing(true)
        return true
    }
    
    func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let rightSpace = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([leftSpace, rightSpace], animated: false)
        toolbar.sizeToFit()
        
        weightTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        setWeight()
        self.view.endEditing(true)
    }
}

