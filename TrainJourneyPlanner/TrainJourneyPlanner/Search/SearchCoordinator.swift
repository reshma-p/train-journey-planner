//
//  SearchCoordinator.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 06/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator, Scene {
    
    // MARK: Static properties
    static var storyboard: UIStoryboard = UIStoryboard(name: "Search", bundle: Bundle.main)
    
    static var initialViewController: UIViewController? {
        return storyboard.instantiateInitialViewController()
    }
    
    init(rootViewController: UINavigationController){
        self.rootViewController = rootViewController
    }
    
    // MARK: Coordinator implementation
    var rootViewController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        
    }
    
    func finish() {
        
    }
    
    
    
}
