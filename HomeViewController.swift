//
//  ViewController.swift
//  waterAppV6
//
//  Created by Charlie on 2/2/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var delegate: SideMenuTableController!
    
    //MARK: - Cache References
    let userData : UserDataController = UserDataController()
    
    //MARK: - IBOutlets
    @IBOutlet weak var cup: Cup!
    @IBOutlet weak var water: Water!
    @IBOutlet weak var waterUnitsLabel: UILabel!
    
    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //testFuncToDelete()
        loadCup()
        loadWater()
        loadText()
    }
    
    //MARK: - IBActions
    @IBAction func AddButtonPressed(_ sender: UIButton) {
        AddWater()
    }
    
    func testFuncToDelete() {
        userData.setTotalWater()
        userData.resetCurrentWater()
    }
}

//MARK: - Cup & Water Method
extension HomeViewController {
    func loadCup() {
        cup.loadImage()
    }
    
    func loadWater() {
        water.loadImage()
    }
    
    func updateWater(amountDrank: Int) {
        var currentWater = userData.getCurrentWater()
        let expectedWater = currentWater + amountDrank
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            if currentWater < expectedWater {
                currentWater += 1
                self.userData.setCurrentWater(waterAmount: 1)
                self.loadWater()
                self.loadText()
            } else {
                timer.invalidate()
            }
        }
        
    }
    
}

//MARK: - Water Text Methods
extension HomeViewController {
    
    func loadText() {
        let currentWaterText = userData.getCurrentWater()
        let totalWaterText = userData.getTotalWater()
        
        waterUnitsLabel.text = "\(currentWaterText) oz / \(totalWaterText) oz"
    }
}

//MARK: - Add Water Methods
extension HomeViewController {
    func AddWater() {
        let alertController = UIAlertController(title: "How Much Water Did you Drink?", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let alertAction = UIAlertAction(title: "Input Water", style: .default) { (action) in
            
            if let waterAmount = Int(textField.text!) {
                self.updateWater(amountDrank: waterAmount)
            }
        }
        
        alertController.addTextField { (alertTextField) in
            alertTextField.keyboardType = .numberPad
            alertTextField.placeholder = "0"
            
            textField = alertTextField
        }
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
