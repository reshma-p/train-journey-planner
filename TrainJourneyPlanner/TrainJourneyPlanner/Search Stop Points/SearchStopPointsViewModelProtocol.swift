//
//  SearchStopPointsViewModelProtocol.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 17/02/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation


/// Defines the protocol for the ViewModel in the Search feature
protocol SearchStopPointsViewModelType {
    var viewDelegate: SearchStopPointsViewDelegate? { get set }
    
    // MARK: Events
    func onTextValueChanged(textValue: String)
}

/// Defines the  protocol for the delegate to handle the updates from the SearchViewModelType
protocol SearchStopPointsViewDelegate: class {
    
    func showResult(_ stopPoints: [StopPoint])
    func showErrorAlert(_ error: String)
    
}

