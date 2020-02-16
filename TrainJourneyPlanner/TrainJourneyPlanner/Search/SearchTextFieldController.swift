//
//  SearchTextFieldController.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 16/02/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import Foundation
import UIKit

class SearchTextFieldController: NSObject, CustomSearchTextFieldController {
    
    
    weak var textField: CustomSearchTextField?
    var viewModel: SearchViewModelType?
    var dataSource: RKUITableDataSource?
    
    required init(textField: CustomSearchTextField) {
        self.textField = textField
    }
    
    func setup(searchViewModel: SearchViewModelType, dataSource: RKUITableDataSource) {
        self.viewModel = searchViewModel
        self.dataSource = dataSource
        
        // Setting up the delegates
        self.viewModel?.viewDelegate = self
        self.textField?.delegate = self
    }
    
    func setupTextField(placeholder: String) {
        self.textField?.placeholder = placeholder
        
        if let datasource = self.dataSource {
            self.textField?.setupData(dataSource: datasource)
        }
        
    }
}


extension SearchTextFieldController {
    /// Handles the behaviour for when Return button is tapped.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /// Handles the editing part of the field.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if let value = textField.text {
            viewModel?.onTextValueChange(textValue: value)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textField?.onEditingEnd()
    }
    
    func reloadData() {
        self.textField?.showResults()
    }
}

extension SearchTextFieldController: SearchViewModelViewDelegate {
    func showResult(_ stopPoints: [StopPoint]) {
        if let dataSource = self.dataSource as? SearchTableDataSource {
            dataSource.updateData(data: stopPoints)
            DispatchQueue.main.async { [weak self] in
                self?.reloadData()
            }
        }
    }
    
    func showErrorAlert(_ error: String) {
        print(" ERROR : \(error)")
    }
}
