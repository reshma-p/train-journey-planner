//
//  ViewController.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 12/09/2019.
//  Copyright © 2019 RP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // - MARK: View elements
    @IBOutlet weak var searchBar: UISearchBar!
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
    }
}


// - MARK: SearchBar delegate
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching for \(searchText)")
    }
}
