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
        loadQuestions()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ChartTableViewCell") as! ChartTableViewCell
        let question = dataSource[indexPath.section]
        cell.data = question
        cell.question?.text = question.text
        cell.myColors = colors
        cell.setChart(dataPoints: question.chartData.map { $0.text },
                      values: question.chartData.map { Double($0.percentage) })
        return cell
    }

    // MARK: - Networking

    func loadQuestions() {
        fetchQuestions { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.colors = response.colors
                self.dataSource = response.questions
                self.tableView.reloadData()
            case .failure(let error):
                print("unable to load questions:", error)
            }
        }
    }
}
