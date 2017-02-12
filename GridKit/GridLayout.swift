//
//  GridLayout.swift
//  GridKit
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import Foundation
import UIKit

public struct GridLayout {
    
    public let tintColor: UIColor
    
    public let highlightColor: UIColor
    
    public let rowWidth: CGFloat
    public let rowHeight: CGFloat
    
    public let sectionHeaderFont: UIFont
    public let sectionHeaderTextColor: UIColor
    
    public let backgroundColor: UIColor
    
    public init(tintColor: UIColor, highlightColor: UIColor, rowWidth: CGFloat, rowHeight: CGFloat, sectionHeaderFont: UIFont = UIFont.boldSystemFont(ofSize: 16), sectionHeaderTextColor: UIColor, backgroundColor: UIColor) {
        self.tintColor = tintColor
        self.highlightColor = highlightColor
        self.rowWidth = rowWidth
        self.rowHeight = rowHeight
        self.sectionHeaderFont = sectionHeaderFont
        self.sectionHeaderTextColor = sectionHeaderTextColor
        self.backgroundColor = backgroundColor
    }
}
