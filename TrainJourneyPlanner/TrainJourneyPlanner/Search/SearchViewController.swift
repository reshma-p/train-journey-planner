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
    private(set) var viewModel : SearchViewModelProtocol?
    
    // MARK: UI outlets
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
    
    // MARK: UI Action methods
    @IBAction func onSourceTextValueChange(_ sender: UITextField) {
        print("source value : \(sender.text)")
    }
    
    @IBAction func onTargetTextValueChange(_ sender: UITextField) {
        print("target value : \(sender.text)")
    }
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Member functions
    func setup(with viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
    }
}
