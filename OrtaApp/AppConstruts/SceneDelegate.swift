//
//  SceneDelegate.swift
//  OrtaApp
//
//  Created by Алишер Сайдешев on 28.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = AuthorizationViewController()
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

