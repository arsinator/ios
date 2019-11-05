//
//  dragNDrop.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 03/11/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class dragNDrop: UICollectionView {
    
    let dataSrc = dataSourceForCollection()
    
    override  init(frame fraame: CGRect, collectionViewLayout layout: UICollectionViewLayout){
        super.init(frame: fraame,collectionViewLayout: layout)
        self.backgroundColor = .white
        self.dataSource = dataSrc
        self.delegate = dataSrc
        self.dragDelegate = dataSrc
        self.dropDelegate = dataSrc
        self.isScrollEnabled = true
        self.dragInteractionEnabled = true
        
        self.register(collectionCell.self, forCellWithReuseIdentifier: "menuCell")
        
        //        self.frame = frame
        //        self.collectionViewLayout = collectionViewLayout
    }
    func insert(str : String){
        dataSrc.items[0].insert(str, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
