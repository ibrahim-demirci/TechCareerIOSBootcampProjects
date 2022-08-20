//
//  ViewController.swift
//  Homework3
//
//  Created by İbrahim on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Aboreto-Regular", size: 25)!]
        navBarAppearence.shadowImage = nil
        navBarAppearence.shadowColor = nil
        navBarAppearence.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = navBarAppearence
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        navigationController?.navigationBar.compactAppearance = navBarAppearence
        navigationController?.navigationBar.tintColor = .black

        
        let itemAppearence = UITabBarItemAppearance()
        itemAppearence.selected.iconColor = UIColor(named: "main")
        itemAppearence.normal.iconColor = UIColor.darkGray
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.shadowColor = nil
        tabBarAppearance.shadowImage = nil
        tabBarAppearance.stackedLayoutAppearance = itemAppearence
        tabBarAppearance.inlineLayoutAppearance = itemAppearence
        tabBarAppearance.compactInlineLayoutAppearance = itemAppearence
        
        tabBarController?.tabBar.standardAppearance = tabBarAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarAppearance
    
    }
    
    
}

