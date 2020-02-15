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
    @IBOutlet weak var sourceTextField: CustomSearchTextField!
    @IBOutlet weak var targetTextField: CustomSearchTextField!
    
    let searchTableDataSource = SearchTableDataSource()
    
    // MARK: UI Action methods
    @IBAction func onSourceTextValueChange(_ sender: CustomSearchTextField) {
        viewModel?.onSourceTextValueChange(textValue: sender.text ?? "")
        sourceTextField.showTable()
    }

    @IBAction func onTargetTextValueChange(_ sender: CustomSearchTextField) {
       
    }
    
    

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceTextField.setup(dataSource: SearchTableDataSource())
        targetTextField.setup(dataSource: SearchTableDataSource())
        
        sourceTextField.delegate = self
    }
    
    // MARK: Member functions
    func setup(with viewModel: SearchViewModelType) {
        self.viewModel = viewModel
        self.viewModel?.viewDelegate = self
    }
}

// MARK: Extension : SearchViewModelViewDelegate
extension SearchViewController: SearchViewModelViewDelegate {
    
    func showResult(_ stopPoints: [StopPoint]) {
        print(" Matches : \(stopPoints)")
        if let dataSource = sourceTextField.dataSource as? SearchTableDataSource {
            dataSource.updateData(data: stopPoints)
            DispatchQueue.main.async { [weak self] in
                self?.sourceTextField.reloadData()
            }
        }
       
    }
    
    func showErrorAlert(_ error: String) {
        print(" ERROR : \(error)")
    }
}


extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
