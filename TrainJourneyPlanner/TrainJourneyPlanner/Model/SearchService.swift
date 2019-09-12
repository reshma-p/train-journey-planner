//
//  SearchService.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 12/09/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import Foundation


/**
 The protocol for the Search Service.
 */
protocol SearchService{
    func fetchStopPoints<T:SearchDelegate>(searchString: String, delegate: T)
}

/**
 The protocol for the Post delegate.
 */
protocol SearchDelegate{
    func onSuccess(searchResult: SearchResult)
    func onFailure(error: NetworkError)
}


/**
 - The service is responsible to fetch the stop points data
 */
class SearchServiceClient: SearchService{
    func fetchStopPoints<T>(searchString: String, delegate: T) where T : SearchDelegate {
//        let urlString = "https://api.tfl.gov.uk/StopPoint/Search/\(searchString)"
        
        guard let urlVal = URL(string:"https://api.tfl.gov.uk/StopPoint/Search/\(searchString)") else { return }
        
        
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
        
//
//        if let urlComponents = URLComponents(string: urlString) {
//            guard let url = urlComponents.url else { return }
//
//            var urlRequest = URLRequest(url: url)
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//            urlRequest.httpMethod = "Get"
//
//            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//                if error != nil {
//                    print("Error : \(String(describing: error))")
//                } else if let data = data,
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode == 200 {
//
//                    if let utf8Representation = String(data: data, encoding: .utf8) {
//                        print("response: ", utf8Representation)
//                    } else {
//                        print("no readable data received in response")
//                    }
//                }else{
//                    print("generic issue")
//                    //                    // TODO :   1) Handle retries for server errors 5xx
//                    //                    //          2) Most of the 4xx errors shouldnt be retried, instead would require an action by us
//                    //                    //          3) What other errors should we look into handling retries for ?
//                    //                    if let response = response as? HTTPURLResponse{
//                    //                        delegate.onFailure(NetworkError.RequestFailedWithStatusCode(response.statusCode),response)
//                    //                    }else{
//                    //                        // Since Response is empty, returning the appropriate Error in this case.
//                    //                        delegate.onFailure(NetworkError.RequestFailedNoResponse,nil)
//                    //                    }
//                }
//            }
//            dataTask.resume()
        
    }
    
    
    
    
}


