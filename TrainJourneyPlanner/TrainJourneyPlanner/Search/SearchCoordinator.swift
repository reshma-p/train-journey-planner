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

    // MARK: Properties
    var rootNavigationController: UINavigationController
    
    // MARK: Initialisers
    init(rootNavigationController: UINavigationController){
        self.rootNavigationController = rootNavigationController
    }
    
    // MARK: Coordinator implementation
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
       
        guard let viewController = SearchCoordinator.storyboard.instantiateInitialViewController() as? SearchViewController else {
            fatalError("Search coordinator started with InitialViewController which is not SearchViewController ")
            return
        }
        
        let viewModel = SearchViewModel(searchService: SearchService(networkManager: NetworkManager()))
        viewModel.viewDelegate = viewController
        viewController.setup(with: viewModel)
        
        rootNavigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        
    }
}
