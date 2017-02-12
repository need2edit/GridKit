//
//  ScrollingRowCell.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit

public class ScrollingRowCell<T, Cell: UICollectionViewCell>: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var layout: GridLayout! {
        didSet {
            itemsCollectionView.backgroundColor = layout.backgroundColor
            nameLabel.textColor = layout.sectionHeaderTextColor
        }
    }
    
    var row: Row<T>!
    var configure: (T, Cell) -> () = { _, _ in }
    
    public var didSelect: (T) -> () = { _ in }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Name"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupView() {
        
        addSubview(itemsCollectionView)
        addSubview(nameLabel)
        
        addConstraintsWithFormat("V:|-[v0]-[v1]|", views: nameLabel, itemsCollectionView)
        addConstraintsWithFormat("H:|-[v0]|", views: nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: itemsCollectionView)
        
        itemsCollectionView.register(Cell.self)
        
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Implement in subclass")
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return row.items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: layout.rowWidth, height: self.itemsCollectionView.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: Cell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let item = row.items[indexPath.row]
        configure(item, cell)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8.0, bottom: 0.0, right: 8.0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect(row.items[indexPath.row])
    }
}
