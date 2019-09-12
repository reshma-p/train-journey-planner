//
//  ViewController.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 12/09/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // - MARK: Variables
    var tableData: [StopPoint] = []

    // - MARK: View elements
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
}


// - MARK: SearchBar delegate
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching for \(searchText)")
        
        if(searchText.count > 3){
            SearchServiceClient().fetchStopPoints(searchString: searchText, delegate: self)
        }
        
    }
}

// - MARK: Search result delegate
extension ViewController: SearchDelegate{
    func onSuccess(searchResult: SearchResult) {
        print("Onsuccess --- yay!! \(searchResult.matches.count)")
        tableData = searchResult.matches
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("RELOAD called")
        }
    }
    
    func onFailure(error: NetworkError) {
        print("onFailure")
    }
}

// - MARK: Table view datasource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableData.count == 0){
            tableView.separatorStyle = .none
        }
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = tableData[indexPath.item].name
        print("Name : \(tableData[indexPath.item].name)")
        return cell
    }
    
    
}

// - MARK: Table view delegate
extension ViewController: UITableViewDelegate{
    
}
