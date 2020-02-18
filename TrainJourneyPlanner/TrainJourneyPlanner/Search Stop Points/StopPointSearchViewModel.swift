//
//  SearchStopPointViewModel.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 18/02/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation

/// Viewmodel for the Search results
class StopPointSearchViewModel: StopPointSearchViewModelType {
    
    private(set) var searchService : SearchServiceType
    
    // MARK: Initialiser
    init(searchService: SearchServiceType) {
        self.searchService = searchService
    }

    // MARK: SearchStopPointsViewModelType implementation
    weak var viewDelegate: StopPointSearchViewDelegate?
    
    func onTextValueChanged(textValue: String) {
        if(textValue.count >= 3){
            searchService.fetchStopPoints(searchString: textValue, delegate: self)
        }
    }
}

// MARK: SearchDelegate implementation
extension StopPointSearchViewModel: SearchDelegate {
    func onSuccess(stopPoints: [StopPoint]) {
        
    }
    
    func onFailure(error: NetworkError) {
        
    }
    
    
}
