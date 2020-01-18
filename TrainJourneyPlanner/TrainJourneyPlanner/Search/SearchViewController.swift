//
//  SearchViewController.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 08/01/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    // MARK: Member properties
    private(set) var viewModel : SearchViewModelType?
    
    // MARK: UI outlets
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
    
    let searchTableDataSource = SearchTableDataSource()
    
    // MARK: UI Action methods
    @IBAction func onSourceTextValueChange(_ sender: UITextField) {
        viewModel?.onSourceTextValueChange(textValue: sender.text ?? "")
    }
    
    @IBAction func onTargetTextValueChange(_ sender: UITextField) {
        print("target value : \(sender.text)")
    }
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTableView.dataSource = searchTableDataSource
        // Do any additional setup after loading the view.
    }
    
    // MARK: Member functions
    func setup(with viewModel: SearchViewModelType) {
        self.viewModel = viewModel
        self.viewModel?.viewDelegate = self
    }
}

extension SearchViewController: SearchViewModelViewDelegate {
    func showResult(_ searchResult: SearchResult) {
        print(" Matches : \(searchResult.matches)")
        self.searchTableDataSource.updateData(data: searchResult.matches)
        DispatchQueue.main.async { [weak self] in
            self?.searchTableView.reloadData()
        }
    }
    
    func showErrorAlert(_ error: String) {
        print(" ERROR : \(error)")
    }
}

class SearchTableDataSource: NSObject, UITableViewDataSource {
    
    var data: [StopPoint] = []
    
    func updateData(data: [StopPoint]){
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StopPointsCell") else {
            fatalError("No cell class has been registered for StopPointsCell")
        }
        cell.textLabel?.text = data[indexPath.item].name
        return cell
    }
    
   
    
    
}
