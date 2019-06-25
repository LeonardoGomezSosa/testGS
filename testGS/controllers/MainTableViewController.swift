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
        self.tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.estimatedRowHeight = 100
        tableView.estimatedRowHeight = UITableView.automaticDimension

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
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputTableViewCell") as! InputTableViewCell

            return cell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
            cell = UITableViewCell()
            cell.accessoryType = .detailButton
            cell.textLabel?.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
            return cell
        default:
            cell = UITableViewCell()
            cell.textLabel?.text = text
        }
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.section
        if index == 2 {
            self.navigationController?.pushViewController(CustomTableViewController(), animated: true)
        }
    }
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        let index = indexPath.section
//        if index == 2 {
//        }
//    }
//

}
