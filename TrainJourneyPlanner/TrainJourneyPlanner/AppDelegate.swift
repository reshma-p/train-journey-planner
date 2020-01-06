//
//  AppDelegate.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 12/09/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        
        appCoordinator.start()
        
        return true
    }

}

