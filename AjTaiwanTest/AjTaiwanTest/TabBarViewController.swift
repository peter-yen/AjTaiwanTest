//
//  TabBarViewController.swift
//  AjTaiwanTest
//
//  Created by 嚴啟睿 on 2020/10/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    var searchVC: SearchViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupController()
        
    }
    
    func setupController() {
        self.searchVC = SearchViewController()
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal)
        let searchNC = UINavigationController(rootViewController: searchVC)
        searchVC.title = "搜尋"
        
        self.viewControllers = [searchNC]
    }
    

}
