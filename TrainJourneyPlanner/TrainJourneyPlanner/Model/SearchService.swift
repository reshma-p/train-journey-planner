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
    
    var networkManager: HttpNetworkType?
    
    init(networkManager: HttpNetworkType){
        self.networkManager = networkManager
    }
    
    let host = "https://api.tfl.gov.uk"
    
    /// Documentation : https://api.tfl.gov.uk/swagger/ui/index.html?url=/swagger/docs/v1#!/StopPoint/StopPoint_Search
    func fetchStopPoints<T>(searchString: String, delegate: T) where T : SearchDelegate {
        
        let stopPointSearchRequest = StopPointSeachRequest(searchString: searchString)
        
        networkManager?.performCall(with: stopPointSearchRequest, baseUrl: host) { completion in
            do {
                let result = try completion()
                
                switch result {
                    case .success(let data) :
                        let response = try JSONDecoder().decode(SearchResult.self, from: data)
                        delegate.onSuccess(stopPoints: response.matches)
                    case .failure(let error) :
                        delegate.onFailure(error: NetworkError.RequestFailed(error))
                }
            } catch (let error){
                delegate.onFailure(error: NetworkError.RequestFailed(error))
            }
        
        }
    }
}


struct StopPointSeachRequest: HttpRequest {
    
    var type: RequestType = RequestType.GET
    
    var endPoint: String = "/StopPoint/Search/{searchString}"
    
    var headers: [String : String] = [:]
    
    var bodyJsonData: Data? = nil
    
    init(searchString: String) { 
        self.endPoint = self.endPoint.replacingOccurrences(of: "{searchString}", with: searchString)
    }
}
