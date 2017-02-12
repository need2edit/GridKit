//
//  ScrollingRowCell.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit


/// Manages a list of items scrolling horizontally.
/// 
/// Scrolling rows have a title label and list of items as a `UICollectionView`.
///
/// `ScrollingRowCell`s automatically register a custom `UICollectionViewCell` and pass through UICollectionViewDataSource methods via callbacks.
///
/// The system works by passing a `didSelect` callback from the parent view controller. This callback is fired during the `UICollectionViewDelegate` didSelectItemAt:indexPath method.
public class ScrollingRowCell<T, Cell: UICollectionViewCell>: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Layout & Formatting
    
    /// Controls the styling for the scrolling row. Works in conjunction with the cell's layout to configure the overall appearance.
    var layout: GridLayout! {
        didSet {
            itemsCollectionView.backgroundColor = layout.backgroundColor
            nameLabel.textColor = layout.sectionHeaderTextColor
        }
    }
    
    /// A section label for the row.
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Name"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    /// The horizontally scrolling collection view that manages the items for the provided row.
    let itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    /// A callback for configuring the item of type `T` and a collection view generic subclass of UICollectionViewCell.
    var configure: (T, Cell) -> () = { _, _ in }
    
    /// The data source for this row.
    var row: Row<T>!
    
    // MARK: - Item Selection
    
    /// A callback for reacting to when a user selects an item in the row.
    public var didSelect: (T) -> () = { _ in }
    
    /// Sets up the label on top of the collection view.
    private func setupView() {
        
        addSubview(itemsCollectionView)
        addSubview(nameLabel)
        
        addConstraintsWithFormat("V:|-[v0]-[v1]|", views: nameLabel, itemsCollectionView)
        addConstraintsWithFormat("H:|-[v0]|", views: nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: itemsCollectionView)
        
        itemsCollectionView.register(Cell.self)
        
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
        
        
    }
    
    // MARK: - Intializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Implement in subclass")
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return row.items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: layout.itemWidth, height: self.itemsCollectionView.frame.height)
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
