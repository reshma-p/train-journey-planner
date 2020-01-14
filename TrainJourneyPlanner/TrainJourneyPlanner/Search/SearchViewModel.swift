//
//  SearchViewModel.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 14/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol {
    func fetchStopPoints() -> SearchResult
}

class SearchViewModel: SearchViewModelProtocol { 
    
    private(set) var searchService : SearchService
    
    init(searchService: SearchService) {
        self.searchService = searchService
    }
    func fetchStopPoints() -> SearchResult {
        return SearchResult(matches: [StopPoint(name: "xxx", modes: [""])])
    }
    
    
    
}
