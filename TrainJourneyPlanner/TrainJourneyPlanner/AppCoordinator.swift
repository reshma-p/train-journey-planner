//
//  AppCoordinator.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 06/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    //MARK: Properties
    var window: UIWindow?
    
    var rootViewController: UINavigationController

    
    //MARK: Initialiser
    init(window: UIWindow?) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: Coordinator implementation
    var childCoordinators: [Coordinator] = []
    
    func start() {
    
        guard let window = window else {
            return
        }
        
        window.rootViewController = self.rootViewController
        window.makeKeyAndVisible()
        
        let searchCoordinator = SearchCoordinator(navigationController: rootViewController)
        self.addChildCoordinator(searchCoordinator)
        searchCoordinator.start()
    }
    
    func finish() {
        
    }
    
    
}
