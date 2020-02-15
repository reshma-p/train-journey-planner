//
//  NetworkEnum.swift
//  roundup-savings
//
//  Created by Reshma Pinto on 18/01/2020.
//  Copyright © 2020 Kurdekar. All rights reserved.
//

import Foundation

///  Possible errors thrown by the Network calls
public enum NetworkError: Error{
    case RequestFailedWithStatusCode(_ statusCode: Int)
    case RequestFailed(_ error: Error)
    case RequestFailedNoResponse
    
    case InvalidRequest
}
