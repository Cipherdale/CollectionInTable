//
//  TableViewCellWithCollectionView.swift
//  CollectionInTable
//
//  Created by Andrian Yohanes on 7/25/17.
//  Copyright © 2017 episquare. All rights reserved.
//

import UIKit

class TableViewCellWithCollectionView: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupViewsForTableViewCellWithCollectionView()
    }
    
    required init(coder adecoder: NSCoder) {
        fatalError("init(codeer:) has not been implemented")
    }
    
    /// TableViewCellWithCollectionView properties
    let myCustomCollectionCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    /// Set cell id for CollectionCell and myCustomCollectionCell
    let collectionCellID = "collectionCellID"
    
    /// Setup dummy data for customCollectionView
    var dataForCollectionView = [CustomCollectionViewData]()
    
    
    
    /// Populate myCustomCollectionCellData
    var myCustomCollectionCellData: TableWithCollectionData? {
        didSet {
            guard let data = myCustomCollectionCellData else { return }
            myCustomCollectionCellLabel.text = data.cellName
            
            // Add data for dataForCollectionView
            guard let collectionViewData = data.cellData else { return }
            dataForCollectionView = collectionViewData
            
            // reload collectionView
            collectionView.reloadData()
            
        }
    }
    
    
    
    /// Setup layout for TableViewCellWithCollectionView.
    func setupViewsForTableViewCellWithCollectionView() {
        
        // Add myCustomCollectionCellLabel & collectionView as a subview
        addSubview(myCustomCollectionCellLabel)
        addSubview(collectionView)
        
        // Setup myCustomCollectionCellLabel layout
        myCustomCollectionCellLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: myCustomCollectionCellLabel.bounds.width, heightConstant: myCustomCollectionCellLabel.bounds.height)
        
        // Setup collectionView layout
        collectionView.anchor(myCustomCollectionCellLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        collectionView.backgroundColor = .yellow
        
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: collectionCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}





/// MARK:- UICollectionViewDataSource & UICollectionViewDelegate
extension TableViewCellWithCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let stringData = dataForCollectionView[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! CollectionCell
        cell.dataForCollectionCell = stringData
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
