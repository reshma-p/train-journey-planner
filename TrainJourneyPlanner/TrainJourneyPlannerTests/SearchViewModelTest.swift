//
//  SearchViewModel.swift
//  TrainJourneyPlannerTests
//
//  Created by Reshma Pinto on 15/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import UIKit
import XCTest

class SearchViewModelTest: XCTestCase {
    
    static let  data: [String: SearchResult] = [
        "Ken" : SearchResult(matches: [StopPoint(name: "Kensington Station", modes: ["bus"])]),
        "James" : SearchResult(matches: [StopPoint(name: "St James Park", modes: ["bus"]),
                                        StopPoint(name: "St James Underground station", modes: ["national-rail"])])]
    
    func testFetchDataSuccess(){
        
    }
    
    class SearchServiceMock: SearchService {
        func fetchStopPoints<T>(searchString: String,delegate: T) where T : SearchDelegate {
            print("fetchStopr points ")
        }
        
        
    }
}




