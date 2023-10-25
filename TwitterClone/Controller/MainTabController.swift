//
//  MainTabController.swift
//  TwitterClone
//
//  Created by chirag arora on 16/02/23.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    //MARK: - Helpers
    
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootVieweController: feed)
        
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootVieweController: explore)
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootVieweController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootVieweController: conversations)
        
        
        viewControllers = [nav1,nav2,nav3,nav4]
        
    }
    
    func templateNavigationController(image: UIImage?, rootVieweController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootVieweController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }
}
