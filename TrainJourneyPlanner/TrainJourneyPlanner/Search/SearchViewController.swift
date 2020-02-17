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

    // MARK: UI Action methods
    @IBAction func onTextFieldEditStart(_ sender: UITextField) {
        
        sender.resignFirstResponder()
        
        print("Edit called on \(sender.tag)")
        
        // Invoke the searchBarview controller
    }
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sourceTextField.tag = SearchTextFieldTags.source.rawValue
        targetTextField.tag = SearchTextFieldTags.target.rawValue
    }
    
    // MARK: Member functions
    func setup(with viewModel: SearchViewModelType) {
        self.viewModel = viewModel
        self.viewModel?.viewDelegate = self
        self.title = "Journey Planner"
    }
}

// MARK: Extension : SearchViewModelViewDelegate
//extension SearchViewController: SearchViewModelViewDelegate {
//    
//    func showResult(_ stopPoints: [StopPoint]) {
//        print(" Matches : \(stopPoints)")
//        self.searchTableDataSource.updateData(data: stopPoints)
//        DispatchQueue.main.async { [weak self] in
////            self?.searchTableView.reloadData()
//        }
//    }
//    
//    func showErrorAlert(_ error: String) {
//        print(" ERROR : \(error)")
//    }
//}

enum SearchTextFieldTags: Int{
    case source = 1
    case target = 2
}
