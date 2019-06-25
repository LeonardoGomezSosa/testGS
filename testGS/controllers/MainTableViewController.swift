//
//  MainTableViewController.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/25/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UITextFieldDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "InputTableViewCell", bundle: nil), forCellReuseIdentifier: "InputTableViewCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var cell = UITableViewCell()
        let index = indexPath.section
        let text = MenuOption(rawValue: index)?.description
        switch index {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "InputTableViewCell") as! InputTableViewCell
            
            return cell
        default:
            cell = UITableViewCell()
            cell.textLabel?.text = text
        }
        
        // Configure the cell...

        return cell
    }

}
