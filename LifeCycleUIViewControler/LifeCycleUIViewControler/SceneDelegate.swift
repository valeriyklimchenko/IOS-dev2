//
//  SceneDelegate.swift
//  LifeCycleUIViewControler
//
//  Created by Валерий Климченко on 10.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
//        Создаем window
        let window = UIWindow(windowScene: scene)
        
//        //Создаем контентный и навигационный контроллеры. Для навигационного контроллера корневым будет ViewController, так как ор стоит выше по навигации
//       let viewController = ViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
        
        //Создаем 3 дочерних VC с заголовком и цветом
        let favouritesViewController = ViewController()
        favouritesViewController.title = "Избранное"
        favouritesViewController.view.backgroundColor = .systemOrange
        
        let downloadsViewController = ViewController()
        downloadsViewController.title = "Загрузки"
        downloadsViewController.view.backgroundColor = .systemYellow
        
        let historyViewwController = ViewController()
        historyViewwController.title = "История"
        historyViewwController.view.backgroundColor = .systemBackground
        
        //Создаем экземпляр UITabBarController
        let tabBarController = UITabBarController()
        
      //Отображение дочерних VC настроим с помощью свойства .tabBarItem, используя кейсы из extention UIRabBarItem для стандартных вкладок
        
        favouritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        downloadsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        historyViewwController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        //Создадим связь между дочерними VC и контейнерным. Для этого запакуем дочерние в массив, затем каждый дочерний вложим в UINavigationController. Эту группу из 3-ех UINavigationController сделаем дочерней к UITabBarController. Таким образом на отдельных вкладках будет сочетаться плоская(UITabBarController) и иерархическая(UINavigationController) навигация
        let controllers = [favouritesViewController, downloadsViewController, historyViewwController]
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
        
        
        tabBarController.selectedIndex = 1
        
        //Зададим первый экран
        window.rootViewController = tabBarController
        
        //Это окно является основным для пользовательского ввода и должно отобразиться
        window.makeKeyAndVisible()
        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

