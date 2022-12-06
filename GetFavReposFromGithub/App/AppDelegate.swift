//
//  AppDelegate.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 11/20/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startApp()
        return true
    }
    
    func startApp() {
        let coreDataManager = CoreDataManager()
        let result = coreDataManager.fetch()
        print(result)
        let reposViewController = ReposViewController(api: NetworkManager())
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController.init(rootViewController: reposViewController)
        window?.makeKeyAndVisible()
    }
}

