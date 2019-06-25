//
//  ChartTableViewCell.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit
import Charts

class ChartTableViewCell: UITableViewCell, ChartViewDelegate {
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var question: UILabel!
    var data: Question!
    var myColors:[String]! = [];
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pieChart.noDataText = "No hay datos para la gráfica."



    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChart.data = pieChartData

        
        var colors: [UIColor] = []
        var index = 0
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            print("=====>index , Color: ", i, myColors[i % dataPoints.count])
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            let myColor = UIColor(hexString: myColors[index % dataPoints.count], alpha: 1) ?? color
            colors.append(myColor)
            index += 1
        }
        
        pieChartDataSet.colors = colors
        
        
        
    }
    
}
