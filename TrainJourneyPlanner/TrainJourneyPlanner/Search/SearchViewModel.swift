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
    
    // MARK: Initialiser
    init(searchService: SearchServiceType) {
        self.searchService = searchService
    }
    
    
    // MARK: Member functions
    
    func onSourceTextValueChange(textValue: String) {
        if(textValue.count >= 3){
            searchService.fetchStopPoints(searchString: textValue, delegate: self)
        }
    }
}


// MARK: Extension : SearchDelegate
extension SearchViewModel: SearchDelegate{
    func onSuccess(searchResult: SearchResult) {
        viewDelegate?.showResult(searchResult)
    }
    
    func onFailure(error: NetworkError) {
        viewDelegate?.showErrorAlert(error.localizedDescription)
    }
    
    
}
