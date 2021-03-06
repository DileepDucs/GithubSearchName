//
//  SceneDelegate.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 23/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = scene as? UIWindowScene else { return }

      window = UIWindow(frame: windowScene.coordinateSpace.bounds)
      
      window?.windowScene = windowScene
      
      let navController = UINavigationController(rootViewController: HomeSearchViewController())
      
      window?.rootViewController = navController
      
      window?.makeKeyAndVisible()
    }

}

