//
//  presenter.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 29/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class presenter: NSObject, viewToPresenterProtocol,interactorToPresenterProtocol {
    var image : UIImage?
    var interector: presenTorToInterectorProtocol?
    var mainView : presenterToViewProtocol?
    func updateView()  {
        if image == nil {
            mainView?.showMesg(mesg: "Image was not yet downloaded")
        }
        else {
            mainView?.updateView(newImage: image!)
        }
    }
    func parseImage(image: UIImage) {
        self.image = image
    }
    func downloadPicture()  {
        interector?.downloadImage()
        mainView?.showMesg(mesg: "Image was downloaded")
    }
    func invalidateCache(){
        interector!.invalidateCache()
        mainView?.showMesg(mesg: "Cache was invalidated!")
    }
   

}
