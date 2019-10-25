//
//  newViewController.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 25/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class newViewController: UIViewController {
    
    var cellThatWasTapped : UITableViewCell?
    override func viewDidLoad() {
        view.backgroundColor = .green
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationItem.title = cellThatWasTapped?.textLabel?.text
        let yourLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        yourLabel.textColor = UIColor.white
        yourLabel.backgroundColor = UIColor.red
        yourLabel.text = cellThatWasTapped?.textLabel?.text
        yourLabel.font =  yourLabel.font.withSize(10)
        yourLabel.frame = CGRect(origin: CGPoint(x: view.center.x,y: view.center.y),size: CGSize(width: 100,height: 100))
        view.addSubview(yourLabel)
        let alertController = UIAlertController(title: "ChangeSectionName", message: "", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "name"
            textField.isSecureTextEntry = false
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { a  in
            let textField2 = alertController.textFields?.first
            yourLabel.text = textField2?.text
            self.navigationItem.title = textField2?.text
            self.cellThatWasTapped?.textLabel?.text = textField2?.text
            self.cellThatWasTapped?.isHighlighted = false
            
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)

    }

}
