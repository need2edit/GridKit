//
//  ViewController.swift
//  Demo
//
//  Created by Jake Young on 2/11/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit
import GridKit

class NetflixViewController: BaseViewController {
    
    var datasource: NetflixDataSource!
    
    override func setupNavigation() {
        super.setupNavigation()
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .blackTranslucent
    }
    
    override func setupData() {
        
        datasource = NetflixDataSource(collectionView: collectionView)
        
        datasource.didSelect = { [weak self] item in
            let alert = UIAlertController(title: "Tapped", message: item, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self?.present(alert, animated: true, completion: nil)
        }
    }

}
