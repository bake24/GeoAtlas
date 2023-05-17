//
//  TabBarViewController.swift
//  Atlas
//
//  Created by Бакдаулет Дуйсенбеков on 12.05.2023.
//


import UIKit
import SnapKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = UIColor(red: 230/255, green: 187/255, blue: 148/255, alpha: 1)
           tabBar.tintColor = .orange
           setupVCs()

        // Do any additional setup after loading the view.
        func setupVCs() {
              viewControllers = [
                  createNavController(for: CountryDetailsViewController(), title: NSLocalizedString("World Countries", comment: ""), image: UIImage(systemName: "book")!),
                  createNavController(for: CountryCollectionViewController(), title: NSLocalizedString("About Us", comment: ""), image: UIImage(systemName: "house")!),
                  createNavController(for:MainViewController(), title: NSLocalizedString("Order", comment: ""), image: UIImage(systemName: "heart")!)
              ]
          }
        
        
         func createNavController(for rootViewController: UIViewController,
                                                         title: String,
                                                         image: UIImage) -> UIViewController {
               let navController = UINavigationController(rootViewController: rootViewController)
               navController.tabBarItem.title = title
               navController.tabBarItem.image = image
               navController.navigationBar.prefersLargeTitles = false
               
               rootViewController.navigationItem.title = "Word Countries"
               return navController
           }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


