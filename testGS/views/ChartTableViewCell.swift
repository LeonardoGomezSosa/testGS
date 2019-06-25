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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

    
}
