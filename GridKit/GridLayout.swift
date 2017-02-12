//
//  GridLayout.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import Foundation
import UIKit


/// Controls the appearance of the Grid with size attributes, fonts, and colors.
public struct GridLayout {

    /// Overall color for UI elements.
    public let tintColor: UIColor
    
    /// A branded color, used to emphasize important elements.
    ///
    /// For example, Netflix uses a bright red color to highlight items on a dark gray backround.
    public let highlightColor: UIColor
    
    /// The width of items in a row.
    ///
    /// - note: All items expand to the height of the row.
    public let itemWidth: CGFloat
    
    /// The distance between each item in the row.
    public let itemSpacing: CGFloat
    
    /// The height of rows in the collection.
    ///
    /// - note: All items expand to the height of the row.
    public let rowHeight: CGFloat
    
    
    /// Font for styling the section header labels in each row.
    public let sectionHeaderFont: UIFont
    
    /// Color of the section header label in each row.
    public let sectionHeaderTextColor: UIColor
    
    /// Overall background color. Used to set the background color of the collection and each row.
    public let backgroundColor: UIColor
    
    /// Designated initializer. Controls overall styling for the grid system.
    ///
    ///
    /// - note: A great way to take advantage of this layout is to extend `GridLayout` with static properties matching your different use cases. The demo included with this framework provides 3 static properties for layouts resembling the App Store, Netflix, and HBONow apps. While these are included for demo purposes, respect the work and don't copy.
    ///
    /// - Parameters:
    ///   - tintColor: The overall tint color for the UI elements.
    ///   - highlightColor: A branded color, used to emphasize important elements.
    ///   - itemWidth: The width of items in a row.
    ///   - itemSpacing: The distance between each item in the row.
    ///   - rowHeight: The height of rows in the collection.
    ///   - sectionHeaderFont: Font for styling the section header labels in each row.
    ///   - sectionHeaderTextColor: Color of the section header label in each row.
    ///   - backgroundColor: Overall background color. Used to set the background color of the collection and each row.
    public init(tintColor: UIColor, highlightColor: UIColor, itemWidth: CGFloat, itemSpacing: CGFloat, rowHeight: CGFloat, sectionHeaderFont: UIFont = UIFont.boldSystemFont(ofSize: 16), sectionHeaderTextColor: UIColor, backgroundColor: UIColor) {
        self.tintColor = tintColor
        self.highlightColor = highlightColor
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        self.rowHeight = rowHeight
        self.sectionHeaderFont = sectionHeaderFont
        self.sectionHeaderTextColor = sectionHeaderTextColor
        self.backgroundColor = backgroundColor
    }
}
