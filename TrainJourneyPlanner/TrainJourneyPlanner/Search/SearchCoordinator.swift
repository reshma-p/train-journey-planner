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
    
    init(rootViewController: UIViewController, rootNavigationController: UINavigationController){
        self.rootViewController = rootViewController
        self.rootNavigationController = rootNavigationController
        
    }
    
    // MARK: Coordinator implementation
    var rootNavigationController: UINavigationController
    var rootViewController: UIViewController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        guard let viewController = rootViewController as? SearchViewController else {
            assertionFailure("Attempt to start the SearchCoordinator with incorrect rootViewController => \(rootViewController)")
            return
        }
        
        let searchService = SearchServiceClient()
        let searchViewModel = SearchViewModel(searchService: searchService)
        viewController.setup(with: searchViewModel)
    }
    
    func finish() {
        
    }
    
    
    
}
