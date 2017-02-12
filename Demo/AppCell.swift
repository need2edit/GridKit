//
//  AppCell.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit

struct App {
    let name: String
    let category: String
    let price: String
}

class AppCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let metadataLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25.0
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.layer.borderWidth = 0.5
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
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(metadataLabel)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, metadataLabel])
        stack.axis = .vertical
        stack.spacing = 2.0
        
        addSubview(stack)
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width)
        addConstraintsWithFormat("V:|-\(imageView.frame.height)-[v0]-|", views: stack)
        
//        addConstraintsWithFormat("H:|[v0]|", views: imageView)
        addConstraintsWithFormat("H:|[v0]|", views: stack)
    }
    
    
}
