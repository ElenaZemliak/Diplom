//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 14.05.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let feedVC = FeedViewController()
    let loginVC = LoginViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
    }
    
    private func setupVC () {

        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "heart.text.square.fill")
        let feedNavController = UINavigationController(rootViewController: feedVC)
        feedVC.navigationItem.title = "Feed"
        
        loginVC.tabBarItem.title = "Profile"
        loginVC.tabBarItem.image = UIImage(systemName: "person.fill")
        let loginNavController = UINavigationController(rootViewController: loginVC)
     

        
        viewControllers = [feedNavController, loginNavController]
        
    }

}
