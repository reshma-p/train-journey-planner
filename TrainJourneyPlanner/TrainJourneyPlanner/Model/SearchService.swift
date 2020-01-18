//
//  SearchService.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 12/09/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import Foundation


/// The service is responsible to fetch the stop points data
class SearchService: SearchServiceType{
    
    let host = "https://api.tfl.gov.uk"
    
    func fetchStopPoints<T>(searchString: String, delegate: T) where T : SearchDelegate {
        
        guard let urlVal = URL(string:"\(host)/StopPoint/Search/\(searchString)") else { return }
        
        Network.get(to: urlVal) { completion in
            
            do {
                let result: Result<Data,NetworkError> = try completion()
                
                switch result{
                case .success(let response):
                    let searchResult = try! JSONDecoder().decode(SearchResult.self, from: response)
                    delegate.onSuccess(searchResult: searchResult)
                case .failure(let failedError):
                    delegate.onFailure(error: failedError)
                }
                
                
            }catch{
                delegate.onFailure(error: NetworkError.RequestFailed(error))
            }
        }
    }
}


