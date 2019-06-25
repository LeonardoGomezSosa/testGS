//
//  CustomTableViewController.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    var dataSource:[Question] = []
    var colors: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ChartTableViewCell", bundle: nil), forCellReuseIdentifier: "ChartTableViewCell")
        getRequestWithAlamofire()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addListeners()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeListeners()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ChartTableViewCell") as! ChartTableViewCell
        cell.data = dataSource[indexPath.section]

        if let text = cell.data.text, text == nil {
            cell.question?.text = "unable to load question"
        } else {
            cell.question?.text = "\((cell.data.text)!)"
        }
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    @objc func printData(notification: Notification){
        print("detecta emision")
        guard let userInfo = (notification.userInfo) as? [String:Any] else { print("no regresa datos"); return}
        guard let colors = userInfo["colors"] as? [String] else { print("no colors in json"); return}
        guard let questions = userInfo["questions"] as? [[String:Any]] else { print("no questions in json"); return}
        self.colors = colors
        for question in questions {
            let q = Question(question)
            dataSource.append(q)
        }
        self.tableView.reloadData()
    }
    
    func addListeners(){
        print("agrega Observable")
        NotificationCenter.default.addObserver(self, selector: #selector(printData), name: NSNotification.Name(rawValue: "alamofireFinished"), object: nil)
    }
    
    func removeListeners(){
        print("remueve observable")
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "alamofireFinished"), object: nil)
    }
    
    
}

class Question {
    var text: String!
    var total: Double!
    var charData: [ChartData]!
    var dictionary:Dictionary<String,Int> = Dictionary<String,Int>()
    
    init(_ question: [String:Any]) {
        guard let text = question["text"] as? String else { return }
        guard let total = question["total"] as? Double else { return }
        guard let chartData = question["chartData"] as? [[String:Any]] else { return }
        self.text = text
        self.total = total
        var data:[ChartData] = []
        var dict:Dictionary<String,Int> = Dictionary<String,Int>()
        for item in chartData {
            let dato = item as! [String:Any]
            dict.updateValue(dato["percetnage"] as! Int, forKey: dato["text"] as! String)
            print (dato)
            data.append(ChartData(item))
        }
        print("dictionary", dict)
        dictionary = dict
        self.charData = data
    }
}
class ChartData{
    var text:String!
    var percentage:Double!
    init(_ data: [String:Any]) {
        self.text = data["text"] as? String
        self.percentage = data["percetnage"] as? Double
    }
}
