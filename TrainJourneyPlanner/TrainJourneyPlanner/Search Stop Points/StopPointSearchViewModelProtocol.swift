//
//  SearchStopPointsViewModelProtocol.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 17/02/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation


/// Defines the protocol for the ViewModel in the Search feature
protocol StopPointSearchViewModelType {
    var viewDelegate: StopPointSearchViewDelegate? { get set }
    
    // MARK: Events
    func onTextValueChanged(textValue: String)
}

/// Defines the  protocol for the delegate to handle the updates from the SearchViewModelType
protocol StopPointSearchViewDelegate: class {
    
    func showResult(_ stopPoints: [StopPoint])
    func showErrorAlert(_ error: String)
}

