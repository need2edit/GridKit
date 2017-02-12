//
//  MyCustomCell.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit

class FullImageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        
        addConstraintsWithFormat("V:|[v0]|", views: imageView)
        addConstraintsWithFormat("H:|[v0]|", views: imageView)
    }
    
    
}
