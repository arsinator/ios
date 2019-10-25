//
//  File.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import Foundation
import UIKit


class RootViewController: UIViewController {
	
    let newController : newViewController = {
        let viewController = newViewController()
        return viewController
    }()
    
	let viewController : ViewController = {
		let viewController = ViewController()
		return viewController
	}()
	
	let button : MyButton = {
			let button = MyButton(type: .custom)
			button.setTitle("Привет!", for: .normal)
			button.backgroundColor = UIColor.white
			button.setTitleColor(UIColor.black, for: .normal)
			button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
			button.frame = CGRect(x: 25.0, y: 100.0, width: 100.0, height: 40.0)
			return button
	}()
	
	let dataSource = DataSource()
	
	let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.white
		navigationItem.title = "Table"
		navigationController?.navigationBar.prefersLargeTitles = true
		updateLayout(with: view.frame.size)
		tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        dataSource.rootDelegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension
		tableView.dataSource = dataSource
		tableView.delegate = dataSource
	}
	
	private func updateLayout(with size: CGSize) {
	   tableView.frame = CGRect.init(origin: .zero, size: size)
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.backgroundColor = UIColor.red
		//view.addSubview(button)
		view.addSubview(tableView)
        tableView.reloadData()
	}
	

	@objc func tapButton () {
		let transition = CATransition()
		transition.duration = 1.5
		transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
		transition.type = CATransitionType.fade
		
		navigationController?.view.layer.add(transition, forKey: "transition")
		navigationController?.pushViewController(viewController, animated: false)
	}
    func cellWasTapped(cell : UITableViewCell){
        
        newController.cellThatWasTapped = cell
        navigationController?.pushViewController(newController, animated: true)
    }
}


class TableViewCell: UITableViewCell {
	override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
   }
}
