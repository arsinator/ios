//
//  ViewController.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class ViewController: UIViewController, presenterToViewProtocol {
    func updateView(newImage: UIImage) {
        let a = UIImageView(image: newImage)
        a.frame = CGRect(x: view.center.x-80, y: button.frame.minY-330, width: 200, height: 300)
        view.addSubview(a)
    }
    
    func showMesg(mesg: String) {
        let ac = UIAlertController(title: title, message: mesg, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default,
                                   handler:nil))
        present(ac, animated: true)
    }
    
    var presenter : viewToPresenterProtocol!
	
	
	let button : UIButton = {
		let button = UIButton(type: .custom)
		button.setTitle("Отобразить", for: .normal)
		button.backgroundColor = UIColor.white
		button.setTitleColor(UIColor.black, for: .normal)
//        button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
		return button
	}()
    let button2 : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Скачать", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    let button3 : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Очистить кэш", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        //        button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
        return button
    }()
    let label : UILabel = {
        let label = UILabel()
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Картинка"
        label.backgroundColor = .red
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action:  #selector(updateViewSelector), for:.touchDown)
        button2.addTarget(self, action:  #selector(downloadPictureSelector), for:.touchDown)
        button3.addTarget(self, action:  #selector(invalidateCacheSelector), for:.touchDown)
        
    }
    @objc func updateViewSelector(){
        presenter.updateView()
    }
    @objc func downloadPictureSelector(){
        presenter.downloadPicture()
    }
    @objc func invalidateCacheSelector(){
        presenter.invalidateCache()
    }
    
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.backgroundColor = UIColor.cyan
        button.frame = CGRect(x: view.center.x-70, y: 400.0, width: 150.0, height: 40.0)
        button2.frame = CGRect(x: view.center.x-50, y: button.frame.maxY+20, width: 100.0, height: 40.0)
        button3.frame = CGRect(x: view.center.x-70, y: button2.frame.maxY+20, width: 150.0, height: 40.0)
        label.frame = CGRect(x: view.center.x-80, y: button.frame.minY-330, width: 200, height: 300)
		view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(label)
        
	
	}
    override func viewDidAppear(_ animated: Bool) {
//        updateView(image: UIImage())
    }
	
	
	
}

