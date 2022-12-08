//
//  SceneDelegate.swift
//  StarWarsCharacterFetcher
//
//  Created by Default on 12/6/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let safeScene = (scene as? UIWindowScene) else { return }
        if window == nil { window = UIWindow(windowScene: safeScene) }
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
        window?.rootViewController = createRootViewController()
    }
    
    private func createRootViewController() -> UIViewController {
        let presenter: HomePresenterProtocol = StarWarsPresenter(repository: StarWarsAPIRepository())
        return ViewController(presenter: presenter)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

