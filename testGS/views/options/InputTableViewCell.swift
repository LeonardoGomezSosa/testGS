//
//  InputTableViewCell.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/25/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
