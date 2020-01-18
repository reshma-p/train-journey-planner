//
//  SearchViewModel.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 14/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation

protocol SearchViewModelType {
    var viewDelegate: SearchViewModelViewDelegate? { get set }
    
    
    // MARK: Events
    func onSourceTextValueChange(textValue: String)
}

protocol SearchViewModelViewDelegate: class {
    
    func showResult(_ searchResult: SearchResult)
    func showErrorAlert(_ error: String)
}


class SearchViewModel: SearchViewModelType {
    func onSourceTextValueChange(textValue: String) {
        if(textValue.count >= 3){
            searchService.fetchStopPoints(searchString: textValue, delegate: self)
        }
    }
    
    
    
    weak var viewDelegate: SearchViewModelViewDelegate?
    
    private(set) var searchService : SearchService
    
    init(searchService: SearchService) {
        self.searchService = searchService
    }
}


extension SearchViewModel: SearchDelegate{
    func onSuccess(searchResult: SearchResult) {
        viewDelegate?.showResult(searchResult)
    }
    
    func onFailure(error: NetworkError) {
        viewDelegate?.showErrorAlert(error.localizedDescription)
    }
    
    
}
