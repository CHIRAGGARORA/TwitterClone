//
//  ExploreController.swift
//  TwitterClone
//
//  Created by chirag arora on 09/09/23.
//

import UIKit

class ExploreController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        
        
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }
}
