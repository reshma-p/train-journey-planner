//
//  NetworkManager.swift
//  UserPosts-demo
//
//  Created by Reshma Pinto on 05/07/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import Foundation


/// Possible request types
enum RequestType: String{
    case GET
    case POST
    case PUT
    case DELETE
}

///  Possible errors thrown by the Network calls
public enum NetworkError:Error {
    case RequestFailedWithStatusCode(_ statusCode: Int)
    case RequestFailed(_ error: Error)
    case RequestFailedNoResponse
}


/// It performs HTTP requests and responses.
enum Network{
    
    //MARK: - Methods
    
    /// Does the HTTP GET to retrieve the data.
    /// - parameters:
    ///     - to: The url used to fetch the data
    ///     - completion: callback function defined by the callee.
    
    static func get(to: URL, completion: @escaping (() throws -> Result<Data, NetworkError>) -> Void){
        var urlRequest = URLRequest(url: to)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = RequestType.GET.rawValue
        
        URLSession(configuration: .default).dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            //Failure
            if let validError = error {
                //TODO: - Handle basic network errors like retries or timeouts.
                completion({
                    throw NetworkError.RequestFailed(validError)
                })
            }
            
            if let receivedData = data{
                completion({
                    return Result.success(receivedData)
                })
            }else{
                completion({
                    throw NetworkError.RequestFailedNoResponse
                })
            }
            
        }).resume()
    }
    
    //TODO: - Will handle post and othe forms of requests

}


