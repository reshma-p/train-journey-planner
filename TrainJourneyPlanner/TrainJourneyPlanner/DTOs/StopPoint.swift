//
//  StopPoint.swift
//  TrainPOCUpdated
//
//  Created by Reshma Pinto on 06/06/2019.
//  Copyright © 2019 Kurdekar. All rights reserved.
//

import Foundation


struct StopPoint: Decodable{
    
    var name: String
    var modes: [String]
}

enum ModeOfTransport: String{
    case BUS = "bus"
    case NATIONAL_RAIL = "national-rail"
}

