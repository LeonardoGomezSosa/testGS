//
//  MainNavigationViewController.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainNavigationContainer()
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    func setupMainNavigationContainer() {
        self.navigationBar.isHidden = true
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .darkGray
    }
    
    
    
}
