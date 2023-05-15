//
//  SceneDelegate.swift
//  4 Rect
//
//  Created by Валерий Климченко on 05.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let viewController = ViewController()
        let navigationController =
        UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        
        self.window = window
        
        window.makeKeyAndVisible()
        
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//
//        let viewController = ViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        window.rootViewController = navigationController
//        self.window = window
//
//        window.makeKeyAndVisible()
    }
}

