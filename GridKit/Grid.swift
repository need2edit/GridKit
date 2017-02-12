//
//  Row.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import Foundation

/*
 
 List of Rows
    Row
      Title
      Items

 */


public struct Grid<T> {
    
    public let rows: [Row<T>]
    
    public func object(forSection section: Int, at index: Int) -> T {
        return rows[section].items[index]
    }
    
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
