//
//  CollectionViewDataSource.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit


/// A generic data source that when applied to a `UICollectionView` creates horizontal scrolling rows.
///
/// Accepts a simple `Grid<T>` object to form the elements in the rows.
///
/// Set the `didSelect` callback to react to tapping on a given row item.
open class GridCollectionDataSource<T, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var layout: GridLayout
    
    var grid: Grid<T>
    var collectionView: UICollectionView
    var configure: (T, Cell) -> ()
    
    public var didSelect: (T) -> () = { _ in }
    
    public init(collectionView: UICollectionView, layout: GridLayout, grid: Grid<T>, configure: @escaping (T, Cell) -> ()) {
        
        self.layout = layout
        self.grid = grid
        self.collectionView = collectionView
        self.configure = configure
        
        super.init()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(ScrollingRowCell<T, Cell>.self)
        
        collectionView.backgroundColor = layout.backgroundColor
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grid.rows.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ScrollingRowCell<T, Cell> = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure = configure
        cell.row = grid.rows[indexPath.section]
        cell.didSelect = didSelect
        cell.nameLabel.text = grid.rows[indexPath.row].title
        cell.nameLabel.font = layout.sectionHeaderFont
        cell.layout = self.layout
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: layout.rowHeight + 32)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8.0, bottom: 0.0, right: 8.0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
