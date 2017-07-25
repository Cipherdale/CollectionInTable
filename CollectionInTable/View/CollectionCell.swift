//
//  CollectionCell.swift
//  CollectionInTable
//
//  Created by Andrian Yohanes on 7/25/17.
//  Copyright © 2017 episquare. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViewsForCollectionCell()
    }
    
    required init(coder adecoder: NSCoder) {
        fatalError("init(codeer:) has not been implemented")
    }
    
    /// CollectionCell Properties
    let myCollectionCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.shadowColor = .gray
        return label
    }()
    
    
    
    /// Populate dataForCollectionCell
    var dataForCollectionCell: CustomCollectionViewData? {
        didSet {
            guard let stringData = dataForCollectionCell else { return }
            myCollectionCellLabel.text = stringData.cellName
        }
    }
    
    
    
    /// Setup layout for CollectionCell.
    func setupViewsForCollectionCell() {
        
        // Add myCollectionCellLabel as a subview
        addSubview(myCollectionCellLabel)
        
        // Setup myCollectionCellLabel layout
        myCollectionCellLabel.anchor(nil, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: myCollectionCellLabel.bounds.height)
        myCollectionCellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Add cell corner radius
        backgroundColor = .clear
        contentView.backgroundColor = .cyan
        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
        
        // Add cell shadow
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
}

