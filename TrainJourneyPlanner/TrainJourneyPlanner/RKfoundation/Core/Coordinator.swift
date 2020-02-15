//
//  Coordinator.swift
//  roundup-savings
//
//  Created by Reshma Pinto on 09/02/2020.
//  Copyright © 2020 Kurdekar. All rights reserved.
//

import Foundation

/// Coordinators are responsible for the app navigation for a feature.
/// They could have more than 1 child coodinator.
protocol Coordinator: class{
    
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    
    func addChildCoordinator(_ coordinator: Coordinator)
    
    func removeChildCoordinator(_ coordinator: Coordinator)
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type)
    
    func removeAllChildCoordinators()
}

// Coordinator provides a default implementation for managing its child coordinators
extension Coordinator{
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {$0 === coordinator}) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}
