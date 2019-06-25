//
//  DescriptionTableViewCell.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/25/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var customLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customLabel.numberOfLines = 0
        customLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
