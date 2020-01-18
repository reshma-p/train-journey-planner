//
//  SearchServiceType.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 18/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation


/// The protocol for the Search Service.
protocol SearchServiceType{
    func fetchStopPoints<T:SearchDelegate>(searchString: String, delegate: T)
}

/// The protocol for the Post delegate.
protocol SearchDelegate{
    func onSuccess(searchResult: SearchResult)
    func onFailure(error: NetworkError)
}
