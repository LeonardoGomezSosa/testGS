//
//  MainTabBarController.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

class MainTabBarController: UINavigationController {
    let mainView = UINavigationController(rootViewController: MainTableViewController())

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setControllers()
        self.setColorsTabBar()
    }
    

    // MARK: - Config
    
    func setControllers () {
        self.viewControllers = [ mainView]
    }
    
    func setColorsTabBar() {
//        self.tabBar.backgroundColor = .lightGray
//        self.tabBar.barTintColor = .darkGray
//        self.tabBar.barStyle = .default
//        self.tabBar.unselectedItemTintColor = .darkGray
//        self.tabBar.tintColor = .lightGray
    }
    // MARK: - Navigation
    
    
}
