//
//  SceneDelegate.swift
//  Atlas
//
//  Created by Бакдаулет Дуйсенбеков on 12.05.2023.
//

import UIKit
import SnapKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let home = TabBarViewController()
        self.window?.rootViewController = home
        window?.makeKeyAndVisible()
        
    }
  
}

