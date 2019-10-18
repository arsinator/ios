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
	
	let viewController : ViewController = {
		let viewController = ViewController()
		return viewController
	}()
	
	let button : UIButton = {
			let button = UIButton(type: .custom)
			button.setTitle("Привет!", for: .normal)
			button.backgroundColor = UIColor.white
			button.setTitleColor(UIColor.black, for: .normal)
			button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
			button.frame = CGRect(x: 25.0, y: 100.0, width: 100.0, height: 40.0)
			return button
	}()
	
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.backgroundColor = UIColor.red
		view.addSubview(button)
	}

	@objc func tapButton () {
		navigationController?.pushViewController(viewController, animated: true)
	}
}

