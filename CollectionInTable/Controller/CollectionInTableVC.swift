//
//  CollectionInTableVC.swift
//  CollectionInTable
//
//  Created by Andrian Yohanes on 7/25/17.
//  Copyright © 2017 episquare. All rights reserved.
//

import UIKit

class CollectionInTableVC: UIViewController {
    
    /// TableView properties.
    let tableView: UITableView = {
        let myTableView = UITableView()
        myTableView.showsVerticalScrollIndicator = false
        myTableView.allowsSelection = false
        myTableView.estimatedRowHeight = 44
        myTableView.backgroundColor = .white
        return myTableView
    }()
    
    /// Set cell id for tableViewCell and tableViewCellWithCollectionView
    let tableViewCell = "tableViewCellID"
    let tableViewCellWithCollectionViewID = "tableViewCellWithCollectionViewID"
    
    /// Setup myCellData
    var myCellData = [TableWithCollectionData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "CollectionInTable"
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableViewCell)
        tableView.register(TableViewCellWithCollectionView.self, forCellReuseIdentifier: tableViewCellWithCollectionViewID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        setupViewsForVC()
        
        // Get data myCellData
        myCellData = TableWithCollectionData.getTableWithCollectionData()
        
        // Reload tableView
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    /// Setup layout for TableView.
    func setupViewsForVC() {
        
        // Add tableView as a subview
        view.addSubview(tableView)
        
        // Setup tableView layout
        tableView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}





extension CollectionInTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData = myCellData[indexPath.row]
        
        // Setup tableViewCellWithCollectionView in row 3
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellWithCollectionViewID, for: indexPath) as! TableViewCellWithCollectionView
            cell.myCustomCollectionCellData = cellData
            return cell
        }
        
        // Setup tableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell, for: indexPath) as! TableViewCell
        cell.myCustomCellData = cellData
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            
        // Row height tableViewCellWithCollectionView
        case 2:
            return 200
            
        // Row height for tableViewCell
        default:
            return 150
        }
    }
}
