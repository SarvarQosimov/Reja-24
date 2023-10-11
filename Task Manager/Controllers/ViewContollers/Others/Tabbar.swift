//
//  Tabbar.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/07/23.
//

import UIKit

class Tabbar: UITabBarController, UITabBarControllerDelegate {
    
    let vc1 = MainVC()
    let vc2 = FlaggedTasks()
    
    private var shapeLayer: CALayer?    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    //MARK: setupTabbar
    func setupTabbar(){
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            tabBar.unselectedItemTintColor = .lightGray
            tabBar.selectedImageTintColor = .white
            tabBar.backgroundColor = .darkGray
        } else {
            tabBar.unselectedItemTintColor = .darkGray
            tabBar.selectedImageTintColor = .white
            tabBar.backgroundColor = .lightGray
        }
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let item1 = UITabBarItem(title: SetLanguage.setLanguage(.homeTitle), image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        vc1.tabBarItem = item1
        
        let nc2 = UINavigationController(rootViewController: vc2)
        let item2 = UITabBarItem(title: nil, image: UIImage(systemName: "flag.fill"), selectedImage: nil)
        vc2.tabBarItem = item2
        
        viewControllers = [nc1, nc2]
    }
}
