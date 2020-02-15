//
//  NetworkManager.swift
//  roundup-savings
//
//  Created by Reshma Pinto on 05/07/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import Foundation

/// It performs HTTP requests and responses.
public class NetworkManager: HttpNetworkType{
    
    
    /// Does the HTTP GET to retrieve the data.
    /// - parameters:
    ///     - to: The url used to fetch the data
    ///     - completion: callback function defined by the callee.
    public func performCall(with request: HttpRequest,baseUrl: String, completion: @escaping (() throws -> Result<Data, NetworkError>) -> Void) {
        
        // Prepare the URL request
        if let urlRequest = request.getUrlRequest(baseUrl: baseUrl) {
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                completion({
                    return self.handleResponse(data, response, error)
                })
            }.resume()
            
        } else {
            completion({
                return Result.failure(NetworkError.InvalidRequest)
            })
        }
    }
    
    // MARK: Helper functions
    private func handleResponse(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Result<Data, NetworkError>{
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let receivedData = data {
            return Result.success(receivedData)
        } else if let receivedError = error{
            return Result.failure(NetworkError.RequestFailed(receivedError))
        } else {
            return Result.failure(NetworkError.RequestFailedNoResponse)
        }
    }
}
