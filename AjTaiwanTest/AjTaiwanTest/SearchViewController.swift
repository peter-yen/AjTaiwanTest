//
//  SearchViewController.swift
//  AjTaiwanTest
//
//  Created by 嚴啟睿 on 2020/10/22.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    lazy var textSearchBar: UISearchBar = {
        let s = UISearchBar()
        s.searchTextField.placeholder = "請輸入文字"
        return s
    }()
    lazy var pageSearchBar: UISearchBar = {
        let s = UISearchBar()
        s.searchTextField.placeholder = "請輸入頁數"
        return s
    }()
    lazy var finishButton: UIButton = {
        let t = UIButton()
        t.clipsToBounds = true
        t.layer.cornerRadius = 15
        t.backgroundColor = .systemBlue
        t.setTitle("搜尋", for: .normal)
        t.addTarget(self, action: #selector(finishButtonDidTap), for: .touchUpInside)
        return t
    }()
    
    @objc func finishButtonDidTap() {
        let photoVC = PhotoViewController()
        navigationController?.pushViewController(photoVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setupSubviews()
        
    }
    
    func setupSubviews() {
        self.view.addSubview(self.textSearchBar.searchTextField)
        self.textSearchBar.searchTextField.snp.makeConstraints { (m) in
            m.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            m.width.equalTo(300)
            m.height.equalTo(35)
            m.centerX.equalToSuperview()
        }
        self.view.addSubview(self.pageSearchBar.searchTextField)
        self.pageSearchBar.searchTextField.snp.makeConstraints { (m) in
            m.top.equalTo(self.textSearchBar.searchTextField.snp.bottom).offset(15)
            m.width.equalTo(300)
            m.height.equalTo(35)
            m.centerX.equalToSuperview()
        }
        self.view.addSubview(self.finishButton)
        self.finishButton.snp.makeConstraints { (m) in
            m.top.equalTo(self.pageSearchBar.searchTextField.snp.bottom).offset(15)
            m.width.equalTo(300)
            m.height.equalTo(35)
            m.centerX.equalToSuperview()
        }
    }
    
}
