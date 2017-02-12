
//
//  BaseViewController.swift
//  GridKit
//
//  Created by Jake Young on 2/12/17.
//  Copyright © 2017 Jake Young. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        setupData()
        setupNavigation()
        
    }
    
    func setupData() {
        
    }
    
    func setupNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(BaseViewController.showSearch))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    
    
}

extension BaseViewController {
    func showMenu() {
        
    }
    
    func showSearch() {
        
    }
}
