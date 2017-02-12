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


/// A generic section within a Grid. Accepts an array of items of type `T`.
///
/// Manages a list of items that scroll horizontally.
///
/// When used in a `Grid<T>`, all the rows inherit the generic type `T`. This ensures that a Grid is a collection of all the same type. 
public struct Row<T> {

    /// The title for the row.
    ///
    /// Useful for table and collection view section management.
    public let title: String?
    
    /// The items in the row.
    ///
    /// Generic and designed to pair with a custom Cell
    public let items: [T]
    
    /// Designated Initalizer. Rows work like sections in Table and Collection views.
    ///
    /// - Parameters:
    ///   - title: The title for the row.
    ///   - items: An array of items for the row.
    public init(title: String? = nil, items: [T]) {
        self.title = title
        self.items = items
    }
}
