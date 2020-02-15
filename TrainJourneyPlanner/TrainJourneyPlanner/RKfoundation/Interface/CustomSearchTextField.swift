//
//  CustomSearchTextField.swift
//  TrainJourneyPlanner
//
//  Created by Reshma Pinto on 15/02/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import UIKit

class CustomSearchTextField: UITextField {

    var tableView: UITableView!
    var dataSource: RKUITableDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Hello nib setup")
        buildTableView()
        
        self.addTarget(self, action: #selector(self.textEditingEnd), for: .editingDidEnd)
    }
    
    @objc func textEditingEnd() {
        tableView.isHidden = true
    }
    
    func buildTableView() {
        if let tableView = tableView, let dataSource = dataSource{
            
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: dataSource.cellIdentifier)
            tableView.dataSource = dataSource
            self.addSubview(tableView)
        } else {
            tableView = UITableView(frame: CGRect.zero)
        }
    }
    
    
    func updateTableView() {
        if let tableView = tableView {
            self.bringSubviewToFront(tableView)
            var tableHeight: CGFloat = 0
            tableHeight = tableView.contentSize.height
            
            // Set a bottom margin of 10p
            if tableHeight < tableView.contentSize.height {
                tableHeight -= 10
            }
            
            // Set tableView frame
            var tableViewFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: tableHeight)
            tableViewFrame.origin = self.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x = 0
            tableViewFrame.origin.y = frame.size.height + 2
            
            
            
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.tableView?.frame = tableViewFrame
            })
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            tableView.reloadData()
        }
    }
    
    func settingTableViewStyle() {
        //Setting tableView style
        tableView.layer.masksToBounds = true
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layer.cornerRadius = 5.0
        
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
    }
    
    func showTable(){
        tableView.isHidden = false
        updateTableView()
    }
    
    func setup(dataSource: RKUITableDataSource) {
        self.dataSource = dataSource
        buildTableView()
    }

    
    func reloadData() {
        updateTableView()
    }
    
}
