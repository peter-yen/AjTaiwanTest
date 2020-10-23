//
//  SearchViewController.swift
//  AjTaiwanTest
//
//  Created by 嚴啟睿 on 2020/10/22.
//

import UIKit
import SnapKit
import Toast_Swift

class SearchViewController: UIViewController {
    
    lazy var textSearchTextField: UISearchTextField = {
        let s = UISearchTextField()
        s.placeholder = "請輸入文字"
        s.addTarget(self, action: #selector(SearchTextFieldEditingChanged), for: .editingChanged)
        return s
    }()
    lazy var pageSearchTextField: UISearchTextField = {
        let s = UISearchTextField()
        s.addTarget(self, action: #selector(SearchTextFieldEditingChanged), for: .editingChanged)
        s.placeholder = "請輸入數量"
        s.keyboardType = .numberPad
        return s
    }()
    @objc func SearchTextFieldEditingChanged() {
        
        if let text = textSearchTextField.text,
           let pageText = pageSearchTextField.text {
            
            if text.isEmpty || pageText.isEmpty == true {
            self.finishButton.isEnabled = false
            self.finishButton.alpha = 0.3
                return
            } else {
                self.finishButton.isEnabled = true
                self.finishButton.alpha = 1
            }
        }
    }
    
    lazy var finishButton: UIButton = {
        let t = UIButton()
        t.alpha = 0.3
        t.isEnabled = false
        t.clipsToBounds = true
        t.layer.cornerRadius = 15
        t.backgroundColor = .systemBlue
        t.setTitle("搜尋", for: .normal)
        t.addTarget(self, action: #selector(finishButtonDidTap), for: .touchUpInside)
        return t
    }()
    @objc func finishButtonDidTap() {
        if let text = pageSearchTextField.text {
            let photoVC = PhotoViewController(pageNumber: Int(text)!)
            navigationController?.pushViewController(photoVC, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setupSubviews()
        
    }
    
    func setupSubviews() {
        self.view.addSubview(self.textSearchTextField)
        self.textSearchTextField.snp.makeConstraints { (m) in
            m.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            m.width.equalTo(300)
            m.height.equalTo(35)
            m.centerX.equalToSuperview()
        }
        self.view.addSubview(self.pageSearchTextField)
        self.pageSearchTextField.snp.makeConstraints { (m) in
            m.top.equalTo(self.textSearchTextField.snp.bottom).offset(15)
            m.width.equalTo(300)
            m.height.equalTo(35)
            m.centerX.equalToSuperview()
        }
        self.view.addSubview(self.finishButton)
        self.finishButton.snp.makeConstraints { (m) in
            m.top.equalTo(self.pageSearchTextField.snp.bottom).offset(15)
            m.width.equalTo(300)
            m.height.equalTo(35)
            m.centerX.equalToSuperview()
        }
    }
    
}
