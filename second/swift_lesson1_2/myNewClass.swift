//
//  myNewClass.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 16/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class myNewClass: NSObject, UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        let ac = UIAlertController(title: "Info", message: "Your viewController is \(viewController)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: {(UIAlertAction) in }))
        viewController.present(ac, animated: true)
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool){
    }
    

}
