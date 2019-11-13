//
//  ViewController.swift
//  safeCollection
//
//  Created by Арсений Ермилов   on 13/11/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myNewCollection = sfColl()
        var i = 0
        while i < 100 {
            myNewCollection.add(number: i)
            i+=1
        }
        myNewCollection.printArr()
        
    }


}

