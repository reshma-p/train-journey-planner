//
//  SearchViewModel.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 14/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation

class SearchViewModel: SearchViewModelType {
    
    // MARK: Properties
    private(set) var searchService : SearchServiceType
    weak var viewDelegate: SearchViewModelViewDelegate?
    var stopPointViewModelType: StopPointSearchViewModelType.Type?
    
    // MARK: Initialiser
    init(searchService: SearchServiceType, stopPointViewModelType: StopPointSearchViewModelType.Type) {
        self.searchService = searchService
        self.stopPointViewModelType = stopPointViewModelType
    }
    
    
    // MARK: Member functions
//    func onSourceTextValueChange(textValue: String) {
//        if(textValue.count >= 3){
//            searchService.fetchStopPoints(searchString: textValue, delegate: self)
//        }
//    }
}


// MARK: Extension : SearchDelegate
//extension SearchViewModel: SearchDelegate{
////    func onSuccess(stopPoints: [StopPoint]) {
////        viewDelegate?.showResult(stopPoints)
////    }
////
////    func onFailure(error: NetworkError) {
////        viewDelegate?.showErrorAlert(error.localizedDescription)
////    }
//    
//    
//}
