//
//  SearchCoordinator.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 06/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation
import UIKit

// Responsible to coordinate between the Viewmodel and View
class SearchCoordinator: Coordinator, Scene {
    
    // MARK: Static properties
    static var storyboard: UIStoryboard = UIStoryboard(name: "Search", bundle: Bundle.main)
    
//    static var initialViewController: UIViewController? {
//        return storyboard.instantiateInitialViewController()
//    }
    
    init(navigationController: UINavigationController){
        self.rootViewController = navigationController
    }
    
    // MARK: Coordinator implementation
    var rootViewController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        guard let viewController = SearchCoordinator.storyboard.instantiateInitialViewController() as? SearchViewController else {
            assertionFailure("Attempt to start the SearchCoordinator with incorrect rootViewController =>")
            return
        }
        
        let searchService = SearchService(networkManager: NetworkManager())
        let searchViewModel = SearchViewModel(searchService: searchService)
        viewController.setup(with: searchViewModel)
        
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        
    }
}
