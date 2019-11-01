//
//  protocols.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 29/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

@objc protocol viewToPresenterProtocol {
    @objc func updateView()
    @objc func downloadPicture()
    func invalidateCache()
}

protocol presenTorToInterectorProtocol {
    func downloadImage()
    func invalidateCache()
}

protocol interactorToPresenterProtocol{
    func parseImage(image :UIImage)
}

protocol presenterToViewProtocol{
    func updateView(newImage: UIImage)
    func showMesg(mesg: String)
}
