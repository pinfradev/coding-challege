//
//  ViewController.swift
//  Images App
//
//  Created by Fray Pineda on 12/2/21.
//

import UIKit

class CustomTabController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.setupTabBar()
    }
    
    func setupTabBar() {
        let home = VCFactory.getViewController(.home)
        home.tabBarItem.title = "Home"
        let favorites = VCFactory.getViewController(.favorites)
        favorites.tabBarItem.title = "Favorites"
        let contact = VCFactory.getViewController(.contactVC)
        contact.tabBarItem.title = "Contact"
        self.viewControllers = [home, favorites, contact]
        self.view.backgroundColor = .white
        self.selectedIndex = 0
    }


}

extension CustomTabController: UITabBarControllerDelegate {
    
}

