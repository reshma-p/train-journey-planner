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
    

    var currentSearch: SearchText?
    let searchTableDataSource = SearchTableDataSource()
    
    // MARK: UI Action methods
    @IBAction func onSourceTextValueChange(_ sender: CustomSearchTextField) {
        currentSearch = SearchText.source
        viewModel?.onSourceTextValueChange(for: currentSearch!, textValue: sender.text ?? "")
        sourceTextField.showTable()
        
    }

    @IBAction func onTargetTextValueChange(_ sender: CustomSearchTextField) {
        currentSearch = SearchText.destination
        viewModel?.onSourceTextValueChange(for: currentSearch!, textValue: sender.text ?? "")
        targetTextField.showTable()
    }
    
    

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField(textfield: sourceTextField, placeholder: "From")
        setupTextField(textfield: targetTextField, placeholder: "To")
    }
    
    func setupTextField(textfield: CustomSearchTextField, placeholder: String){
        textfield.setupData(dataSource: SearchTableDataSource(), tableDelegate: self)
        textfield.delegate = self
        textfield.placeholder = placeholder
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
        
        switch currentSearch {
            case .source:
                if let dataSource = sourceTextField.dataSource as? SearchTableDataSource {
                    dataSource.updateData(data: stopPoints)
                    DispatchQueue.main.async { [weak self] in
                        self?.sourceTextField.reloadData()
                    }
                }
            case .destination:
                if let dataSource = targetTextField.dataSource as? SearchTableDataSource {
                    dataSource.updateData(data: stopPoints)
                    DispatchQueue.main.async { [weak self] in
                        self?.targetTextField.reloadData()
                    }
                }
            default:
                
               return
        }
        
       
    }
    
    func showErrorAlert(_ error: String) {
        print(" ERROR : \(error)")
    }
}


extension SearchViewController: CustomTextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(" SearchViewController : textFieldShouldReturn")
        textField.resignFirstResponder()
        
        return true
    }
}


enum SearchText: String {
    
    case source
    case destination
}
