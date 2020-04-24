//
//  AppDelegate.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let navController = UINavigationController(rootViewController: MovieListVC(networkManager: NetworkManager()))
        navController.isNavigationBarHidden = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }

    

}




   

   
