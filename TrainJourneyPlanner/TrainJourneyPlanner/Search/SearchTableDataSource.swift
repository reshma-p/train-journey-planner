//
//  SearchTableDataSource.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 18/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation
import UIKit

/// Datasource for the SearchTable view
class SearchTableDataSource: NSObject, RKUITableDataSource {
    
    var data: [StopPoint] = []
    let cellIdentifier = "StopPointsCell"
    
    func updateData(data: [StopPoint]){
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            fatalError("No cell class has been registered for \(cellIdentifier)")
        }
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = data[indexPath.item].name
        return cell
    }
}


protocol RKUITableDataSource: UITableViewDataSource {
    var cellIdentifier: String { get }
}
