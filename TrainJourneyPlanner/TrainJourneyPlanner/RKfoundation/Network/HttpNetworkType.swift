//
//  HttpNetworkType.swift
//  roundup-savings
//
//  Created by Pinto, Reshma on 10/02/2020.
//  Copyright © 2020 Kurdekar. All rights reserved.
//

import Foundation

/// Defines the protocol for HTTP network calls,
public protocol HttpNetworkType{
    
    func performCall(with request: HttpRequest, baseUrl: String, completion: @escaping (() throws -> Result<Data, NetworkError>) -> Void)
}

/// Possible request types
public enum RequestType: String{
    case GET
    case POST
    case PUT
    case DELETE
}


public protocol HttpRequest {
    
    var type: RequestType { get set }
    var endPoint: String { get set }
    var headers: [String: String] { get set }
    
    var bodyJsonData: Data? { get set }
    func getUrlRequest(baseUrl: String) -> URLRequest?
    
}

// MARK: Extension for default implementation of getUrlRequest
extension HttpRequest {
    
    func getUrlRequest(baseUrl: String) -> URLRequest? {
        
        var urlString = (baseUrl + self.endPoint).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let url = URL(string: urlString ?? "") {
            var urlRequest = URLRequest(url: url)
            
            /// Setting the headers
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
            
            /// Mapping the http method
            urlRequest.httpMethod = self.type.rawValue
            urlRequest.httpBody = self.bodyJsonData
            
            return urlRequest
        }
        
        return nil
    }
}


