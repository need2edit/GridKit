//
//  CollectionViewHelpers.swift
//  ACPTools
//
//  Created by Jake Young on 10/21/16.
//  Copyright © 2016 Nous Foundation. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /// Syntatic sugar for registering `UICollectionViewCell`s.
    ///
    /// The cell is registered using the name of the class as the reuse identifier. For example, UICollectionViewCell would be registered using the cell identifier "UICollectionViewCell"
    ///
    /// - Parameter _: A subclass of `UICollectionView` to register on the collection.
    public func register<T: UICollectionViewCell>(_: T.Type) {
        let identifier = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: identifier)
    }
    
    /// Syntatic sugar for registering `UICollectionReusableView`s.
    ///
    /// The cell is registered using the name of the class as the reuse identifier. For example, UICollectionReusableView would be registered using the cell identifier "UICollectionReusableView"
    ///
    /// - Parameter _: A subclass of `UICollectionView` to register on the collection.
    public func registerSupplementaryViewOfKind<T: UICollectionReusableView>(_: T.Type, kind: String) {
        let identifier = String(describing: T.self)
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    /// Syntatic sugar for dequeuing a type safe reusable cell at a given indexPath.
    ///
    /// ```
    /// let cell: MyCustomCell = collectionView.dequeueReusableCell(forIndexPath: path)
    /// // returns a cell of type MyCustomCell
    ///
    /// ```
    ///
    /// - Parameter indexPath: the indexPath to dequeue the cell.
    /// - Returns: A cell of type `UICollectionViewCell` cast to the inferred type.
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }
    
    /// Syntatic sugar for dequeuing a type safe supplementary cell at a given indexPath.
    ///
    /// ```
    /// let header: MyCustomHeader = collectionView.dequeueReusableSupplementaryViewOfKind... // returns a cell of type MyCustomHeader
    /// ```
    ///
    /// - Parameter indexPath: the indexPath to dequeue the cell.
    /// - Returns: A cell of type `UICollectionViewCell` cast to the inferred type.
    public func dequeueReusableSupplementaryViewOfKind<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath, kind: String) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }

}


extension UITableView {
    
    /// Syntatic sugar for registering `UITableViewCell`s.
    ///
    /// The cell is registered using the name of the class as the reuse identifier. For example, UITableViewCell would be registered using the cell identifier "UITableViewCell"
    ///
    /// - Parameter _: A subclass of `UITableViewCell` to register on the table.
    public func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing:T.self))
    }
    
    /// Syntatic sugar for dequeuing a type safe reusable cell at a given indexPath.
    ///
    /// ```
    /// let cell: MyCustomCell = tableView(forIndexPath: path) // returns a cell of type MyCustomCell
    /// ```
    ///
    /// - Parameter indexPath: the indexPath to dequeue the cell.
    /// - Returns: A cell of type `UITableViewCell` cast to the inferred type.
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
            
        }
        
        return cell
    }
}
