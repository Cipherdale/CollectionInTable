//
//  Model.swift
//  CollectionInTable
//
//  Created by Andrian Yohanes on 7/25/17.
//  Copyright © 2017 episquare. All rights reserved.
//

import Foundation

struct TableWithCollectionData {
    let cellName: String?
    let cellData: [CustomCollectionViewData]?
    
    static func getTableWithCollectionData() -> [TableWithCollectionData] {
        let data1 = TableWithCollectionData(cellName: "TableViewCell 1", cellData: nil)
        let data2 = TableWithCollectionData(cellName: "TableViewCell 2", cellData: nil)
        let data3 = TableWithCollectionData(cellName: "TableWithCollection", cellData: CustomCollectionViewData.getCustomCollectionViewData())
        let data4 = TableWithCollectionData(cellName: "TableViewCell 4", cellData: nil)
        return [data1, data2, data3, data4]
    }
}

struct CustomCollectionViewData {
    let cellName: String?
    
    static func getCustomCollectionViewData() -> [CustomCollectionViewData] {
        let data1 = CustomCollectionViewData(cellName: "One")
        let data2 = CustomCollectionViewData(cellName: "Two")
        let data3 = CustomCollectionViewData(cellName: "Three")
        let data4 = CustomCollectionViewData(cellName: "Four")
        let data5 = CustomCollectionViewData(cellName: "Five")
        let data6 = CustomCollectionViewData(cellName: "Six")
        let data7 = CustomCollectionViewData(cellName: "Seven")
        return [data1, data2, data3, data4, data5, data6, data7]
    }
    
}
