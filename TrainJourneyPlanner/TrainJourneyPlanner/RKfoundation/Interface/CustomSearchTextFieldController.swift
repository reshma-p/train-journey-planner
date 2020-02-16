//
//  CustomSearchTextFieldController.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 16/02/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation

protocol CustomSearchTextFieldController: class {
    
    var textField: CustomSearchTextField { get }
    
    init(textField: CustomSearchTextField)
    
    var dataSource: RKUITableDataSource { get }
    
    
}
