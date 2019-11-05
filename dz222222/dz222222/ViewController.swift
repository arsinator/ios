//
//  ViewController.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class ViewController:  UIViewController {
    
    var clctView : dragNDrop?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button : UIButton = {
            let button = UIButton(type: .custom)
            button.setTitle("Добавить", for: .normal)
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
            button.frame = CGRect(x: view.frame.maxX-120, y: 0.0, width: 100.0, height: 40.0)
            button.layer.borderWidth = 3
            return button
        }()
        
        view.backgroundColor = .white
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
       
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: view.frame.maxX/4, height: 50)
        
        let first = dragNDrop(frame: .zero ,collectionViewLayout: collectionViewFlowLayout)
        clctView = first
        
        view.addSubview(first)
        view.addSubview(button)
        first.backgroundColor = .white
        
        first.translatesAutoresizingMaskIntoConstraints = false
        first.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 40).isActive = true
        first.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        first.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 80).isActive = true
        first.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        first.dataSrc.o = 1
    }
    
    @objc func tapButton(){
        let alertController = UIAlertController(title: "InsertCell", message: "", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "name"
            textField.isSecureTextEntry = false
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { a  in
            let textField2 = alertController.textFields?.first
            self.clctView?.insert(str: textField2!.text!)
            self.clctView?.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
}

