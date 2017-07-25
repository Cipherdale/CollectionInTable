//
//  TableViewCell.swift
//  CollectionInTable
//
//  Created by Andrian Yohanes on 7/25/17.
//  Copyright © 2017 episquare. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupViewsForMyCustomCell()
    }
    
    required init(coder adecoder: NSCoder) {
        fatalError("init(codeer:) has not been implemented")
    }
    
    /// TableViewCell properties
    let myCustomCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    
    /// Populate myCustomCellData
    var myCustomCellData: TableWithCollectionData? {
        didSet {
            guard let stringData = myCustomCellData else { return }
            myCustomCellLabel.text = stringData.cellName
        }
    }
    
    
    
    /// Setup layout for MyCustomCell.
    func setupViewsForMyCustomCell() {
        
        // Add myCustomCellLabel as a subview
        addSubview(myCustomCellLabel)
        
        // Setup myCustomCellLabel layout
        myCustomCellLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: myCustomCellLabel.bounds.width, heightConstant: myCustomCellLabel.bounds.height)
    }
}
