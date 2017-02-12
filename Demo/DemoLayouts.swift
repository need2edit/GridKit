//
//  DemoLayouts.swift
//  GridKit
//
//  Created by Jake Young on 2/12/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import GridKit

extension GridLayout {
    
    public static let netflix = GridLayout(tintColor: #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1), highlightColor: #colorLiteral(red: 0.8924849629, green: 0.03092195839, blue: 0.08941084892, alpha: 1), rowWidth: 110, rowHeight: 160, sectionHeaderFont: UIFont.boldSystemFont(ofSize: 17), sectionHeaderTextColor: #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1), backgroundColor: #colorLiteral(red: 0.09410236031, green: 0.09412645549, blue: 0.09410081059, alpha: 1))
    
    public static let hbo = GridLayout(tintColor: #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1), highlightColor: #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1), rowWidth: 110, rowHeight: 160, sectionHeaderFont: UIFont.boldSystemFont(ofSize: 17), sectionHeaderTextColor: #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1), backgroundColor: #colorLiteral(red: 0.09410236031, green: 0.09412645549, blue: 0.09410081059, alpha: 1))
    
    public static let appStore = GridLayout(tintColor: .blue, highlightColor: .blue, rowWidth: 95, rowHeight: 166, sectionHeaderFont: UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightRegular), sectionHeaderTextColor: .black, backgroundColor: .white)
    
}

class NetflixDataSource: GridCollectionDataSource<String, FullImageCell> {
    
    init(collectionView: UICollectionView) {
        
        let items = [1,2,3,4,5,6,7,8].map { "Item \($0)" }
        let rows = ["Recently Added", "Trending Now", "Watch It Again", "Popular on Netflix", "Continue Watching for USERNAME"].map { Row<String>(title: $0, items: items) }
        
        let grid = Grid(rows: rows)
        
        super.init(collectionView: collectionView, layout: .netflix, grid: grid) { string , cell in
            cell.imageView.image = #imageLiteral(resourceName: "Poster")
        }
    }
    
}

class AppStoreDataSource: GridCollectionDataSource<App, AppCell> {
    
    init(collectionView: UICollectionView) {
        
        
        let titles = ["Things", "Facebook", "Netflix", "HBONow"]
        
        let apps = titles.map { App(name: $0, category: "Entertainment", price: "$0.99") }
        
        let rows = ["Recently Added", "What's New", "Top Grossing"].map { Row<App>(title: $0, items: apps) }
        
        let grid = Grid(rows: rows)
        
        super.init(collectionView: collectionView, layout: .appStore, grid: grid) { app , cell in
            cell.imageView.image = #imageLiteral(resourceName: "Poster")
            cell.titleLabel.text = app.name
            cell.subtitleLabel.text = app.category
            cell.metadataLabel.text = app.price
        }
    }
    
}
