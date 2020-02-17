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

    
    let searchTableDataSource = SearchTableDataSource()
    
    // MARK: UI Action methods
//    @IBAction func onSourceTextValueChange(_ sender: UITextField) {
//        viewModel?.onSourceTextValueChange(textValue: sender.text ?? "")
//    }
//
//    @IBAction func onTargetTextValueChange(_ sender: UITextField) {
//        print("target value : \(sender.text)")
//    }
//
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.searchTableView.dataSource = searchTableDataSource
    }
    
    // MARK: Member functions
    func setup(with viewModel: SearchViewModelType) {
        self.viewModel = viewModel
        self.viewModel?.viewDelegate = self
        self.title = "Journey Planner"
    }
}

// MARK: Extension : SearchViewModelViewDelegate
extension SearchViewController: SearchViewModelViewDelegate {
    
    func showResult(_ stopPoints: [StopPoint]) {
        print(" Matches : \(stopPoints)")
        self.searchTableDataSource.updateData(data: stopPoints)
        DispatchQueue.main.async { [weak self] in
//            self?.searchTableView.reloadData()
        }
    }
    
    func showErrorAlert(_ error: String) {
        print(" ERROR : \(error)")
    }
}
