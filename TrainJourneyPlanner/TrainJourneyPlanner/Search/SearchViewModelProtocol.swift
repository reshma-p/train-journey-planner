//
//  SearchViewModelProtocol.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 18/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation

/// Defines the protocol for the ViewModel in the Search feature
protocol SearchViewModelType {
    var viewDelegate: SearchViewModelViewDelegate? { get set }
    
    // MARK: Events
    func onSourceTextValueChange(for currentSearch: SearchText, textValue: String)
}

/// Defines the  protocol for the delegate to handle the updates from the SearchViewModelType
protocol SearchViewModelViewDelegate: class {
    
    func showResult(_ stopPoints: [StopPoint])
    func showErrorAlert(_ error: String)
    
}
