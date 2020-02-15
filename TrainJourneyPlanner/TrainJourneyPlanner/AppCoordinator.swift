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
    
    lazy var rootNavigationController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()
    
    //MARK: Initialiser
    init(window: UIWindow?) {
        self.window = window
        
    }
    
    //MARK: Coordinator implementation
    var childCoordinators: [Coordinator] = []
    
    func start() {
    
        guard let window = window, let rootViewController = SearchCoordinator.initialViewController else {
            return
        }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        let searchCoordinator = SearchCoordinator(rootViewController: rootViewController, rootNavigationController: rootNavigationController)
        self.addChildCoordinator(searchCoordinator)
        searchCoordinator.start()
    }
    
    func finish() {
        
    }
    
    
}
