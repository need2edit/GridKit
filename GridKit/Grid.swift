//
//  Row.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import Foundation

/// A grid data source maintains a list of rows.
///
/// Each row has an optional title and a list of items.
///
public struct Grid<T> {
    
    /// The rows in the grid.
    public let rows: [Row<T>]
    
    /// Fetchs an object for a given section and index.
    ///
    /// - Parameters:
    ///   - section: the section the object is in
    ///   - index: the item or row index the object is located at
    /// - Returns: an object of type `T` designated by the data source
    public func object(forSection section: Int, at index: Int) -> T {
        return rows[section].items[index]
    }
    
    
    /// Designated initializer. Accepts an array of rows to form the grid.
    ///
    /// - Parameter rows: The rows of type `T` to populate the grid.
    ///
    public init(rows: [Row<T>]) {
        self.rows = rows
    }
    
}

public struct Row<T> {
    
    public let title: String?
    public let items: [T]
    
    public init(title: String? = nil, items: [T]) {
        self.title = title
        self.items = items
    }
}
