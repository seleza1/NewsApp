//
//  SceneDelegate.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let assembly = ModelBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assembly)
        router.initialViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
