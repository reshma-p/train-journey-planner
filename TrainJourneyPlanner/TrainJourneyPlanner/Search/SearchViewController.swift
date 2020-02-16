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
    
    var sourceFieldManager: SearchTextFieldController?
    var targetFieldManager: SearchTextFieldController?
    

    var currentSearch: SearchText?
    let searchTableDataSource = SearchTableDataSource()

    
    

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnLoad()
    }
    
    func setupOnLoad(){
        
        guard let searchService = viewModel?.searchService else {
            return
        }
        
        sourceFieldManager = SearchTextFieldController(textField: sourceTextField)
        sourceFieldManager!.setup(searchViewModel: SearchViewModel(searchService: searchService), dataSource: SearchTableDataSource())
        
        targetFieldManager = SearchTextFieldController(textField: targetTextField)
        targetFieldManager!.setup(searchViewModel: SearchViewModel(searchService: searchService), dataSource: SearchTableDataSource())
        
        sourceFieldManager!.setupTextField(placeholder: "From")
        targetFieldManager!.setupTextField(placeholder: "To")
        
    }
    
    // MARK: Member functions
    func setup(with viewModel: SearchViewModelType) {
        self.viewModel = viewModel
    }
}


enum SearchText: String {
    
    case source
    case destination
}
