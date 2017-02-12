//
//  CollectionViewHelpers.swift
//  ACPTools
//
//  Created by Jake Young on 10/21/16.
//  Copyright © 2016 Nous Foundation. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    public func register<T: UICollectionViewCell>(_: T.Type) {
        let identifier = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: identifier)
    }
    
    public func registerSupplementaryViewOfKind<T: UICollectionReusableView>(_: T.Type, kind: String) {
        let identifier = String(describing: T.self)
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }
    
    public func dequeueReusableSupplementaryViewOfKind<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath, kind: String) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }

}


extension UITableView {
    
    public func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing:T.self))
    }
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
            
        }
        
        return cell
    }
}
