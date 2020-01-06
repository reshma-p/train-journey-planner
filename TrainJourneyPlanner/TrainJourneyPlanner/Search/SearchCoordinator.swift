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
    var childCoordinators: [Coordinator] = []
    
    func start() {
        
    }
    
    func finish() {
        
    }
    
    
    var storyboard: UIStoryboard = UIStoryboard(name: "Search", bundle: Bundle?)
    
    var rootNavigationController: UINavigationController {
        let navVC = UINavigationController()
        navVC.tabBarItem = .search
        return navVC
    }
    
    
    
}
