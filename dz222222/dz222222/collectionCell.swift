//
//  collectionCellCollectionViewCell.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 03/11/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class collectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.contentView.layer.cornerRadius = 20
        self.layer.cornerRadius = 20
        contentView.layer.borderWidth = 10.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class emptyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.contentView.layer.cornerRadius = 20
        self.layer.cornerRadius = 20
        contentView.layer.borderWidth = 10.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
