//
//  PhotoCollectionViewCell.swift
//  AjTaiwanTest
//
//  Created by 嚴啟睿 on 2020/10/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    lazy var eattablesLabel: UILabel = {
       let l = UILabel()
        l.textAlignment = .center
        l.text = "Hello Motor"
        return l
    }()
    lazy var foodImageView: UIImageView = {
       let g = UIImageView()
        g.clipsToBounds = true
        g.contentMode = .scaleAspectFill
        g.backgroundColor = .red
        g.layer.cornerRadius = frame.width / 4
        return g
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.foodImageView)
        self.foodImageView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        self.addSubview(eattablesLabel)
        self.eattablesLabel.snp.makeConstraints { (m) in
            m.top.equalTo(self.foodImageView.snp.bottom)
            m.centerX.equalToSuperview()
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
