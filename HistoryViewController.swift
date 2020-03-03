//
//  HistoryViewController.swift
//  waterAppV6
//
//  Created by Charlie on 2/23/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import UIKit
import Charts

class HistoryViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNodataEntries()
        
        let months = ["Jan", "Feb", "Mar"]
        let unitsSold = [20.0, 4.0, 6.0]
        
        setChart(dataPoints: months, values: unitsSold)
    }
    
}

//MARK: - Bar Chart Methods
extension HistoryViewController {
    func initNodataEntries() {
        barChartView.noDataText = "You have no Data to show. \nDrink more Water!"
        barChartView.noDataTextAlignment = .center
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        initNodataEntries()
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
            
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Amount of Water Drank")
        
        
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        barChartView.data = chartData
    
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = DateValueFormatter()
        barChartView.xAxis.labelFont = .systemFont(ofSize: 12)
    }
}
