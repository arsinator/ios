//
//  DataSource.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 18/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class DataSource : NSObject, UITableViewDataSource, UITableViewDelegate {
    var rootDelegate : RootViewController?
	
	private var data = [["Photos", "Music"], ["iCloud", "KeyChain", "facebook"], ["twitter", "myspace", "microsoft"], ["samsung", "time", "calendar"]]
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else {
            return 3
        }
	}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 5 // return height as per your requirement
        }
        return 0 // return height as per your requirement
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       return 50
    }
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	   let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textAlignment = NSTextAlignment(rawValue: 1)!
        
        if cell.textLabel?.text == nil {
            cell.textLabel?.text = data[indexPath.section][indexPath.row]
        }
        
        let image : UIImage = UIImage(named: data[indexPath.section][indexPath.row])!
        cell.imageView?.image = image
        
	   return cell
	}
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        
        rootDelegate?.cellWasTapped(cell: (tableView.cellForRow(at: indexPath))!)
    }
    
}
