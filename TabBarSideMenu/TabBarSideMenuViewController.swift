//
//  TabBarSideMenuViewController.swift
//  TabBarSideMenu
//
//  Created by Daniel Bastidas Ramirez on 23/04/2018.
//  Copyright © 2018 Daniel Bastidas. All rights reserved.
//

import UIKit

class TabBarSideMenuViewController: UIViewController ,UITabBarDelegate{
    @IBOutlet weak var sideMenu: SideMenu!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var more: UITabBarItem!
    @IBOutlet weak var favourites: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffect.layer.cornerRadius = 15
        tabBar.delegate = self
    }
    
    func tabBar(_: UITabBar, didSelect: UITabBarItem){
        if didSelect == more {
            sideMenu.click()
        }
        else if didSelect == favourites {
            performSegue(withIdentifier: "ShowFavourites", sender: self)
        }
        tabBar.selectedItem = nil
    }
    
    
    @IBAction func onDragSideMenu(_ sender: UIPanGestureRecognizer) {
        self.sideMenu.slide(gesture: sender)
    }
    
    
}
