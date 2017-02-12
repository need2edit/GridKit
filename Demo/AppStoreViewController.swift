//
//  AppStoreViewController.swift
//  GridKit
//
//  Created by Jake Young on 2/12/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit

class AppStoreViewController: BaseViewController {
    
    var datasource: AppStoreDataSource!
    
    override func setupNavigation() {
        super.setupNavigation()
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.barStyle = .default
    }
    
    override func setupData() {
        
        datasource = AppStoreDataSource(collectionView: collectionView)
        
        datasource.didSelect = { [weak self] app in
            let alert = UIAlertController(title: "Tapped", message: app.name, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
}
