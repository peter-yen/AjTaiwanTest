//
//  ViewController.swift
//  AjTaiwanTest
//
//  Created by 嚴啟睿 on 2020/10/22.
//

import UIKit
import SnapKit

class PraticeViewController: UIViewController, UISearchResultsUpdating {
    var songs = ["Love", "Durant", "Lebron", "Butler", "George", "Tom", "Hary", "Gary", "Peter", "Ray", "Yoasobi"]
    
    var searchSongs = [String]()
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchStr = searchController.searchBar.text
        searchSongs = songs.filter({ (name) -> Bool in
            return name.contains(searchStr!)
        })
        searchTableView.reloadData()
    }
    
    
    open var searchController: UISearchController = {
        let s = UISearchController()
        s.hidesNavigationBarDuringPresentation = false
        s.searchBar.sizeToFit()
        return s
    }()
    
    open var hideSearchBarScroll: Bool!
    
    lazy var searchTableView: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.setupSubview()
        self.updateSearchResults(for: self.searchController)
        
    }
    
    func setupSubview() {
        self.view.addSubview(self.searchController.searchBar)
        self.searchController.searchResultsUpdater = self
        
        navigationItem.searchController = self.searchController
        // 搜尋時隱藏 navigationBar
        self.searchController.hidesNavigationBarDuringPresentation = true
        // 點擊搜尋時不會變暗
        self.searchController.dimsBackgroundDuringPresentation = false
        // 滑動時隱藏 searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
        definesPresentationContext = true
                
        self.view.addSubview(self.searchTableView)
        
        self.searchTableView.snp.makeConstraints { (m) in
            m.top.equalToSuperview()
            m.left.right.equalToSuperview()
            m.bottom.equalToSuperview()
            
        }
    }
    
    
}

extension PraticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if navigationItem.searchController?.isActive == true {
            return searchSongs.count
        } else {
            return songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        
        if navigationItem.searchController?.isActive == true {
                   cell.textLabel?.text = searchSongs[indexPath.row]
               } else {
                   cell.textLabel?.text = songs[indexPath.row]
               }
        return cell
    }
    
    
}
