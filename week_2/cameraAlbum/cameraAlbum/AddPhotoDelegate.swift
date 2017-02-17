//
//  AddPhotoDelegate.swift
//  cameraAlbum
//
//  Created by Eric Pan on 2/16/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit


protocol AddPhotoDelegate: class {
    func addPhotoDoneButtonPressed(by controller: UIViewController, name: String, image: NSData, date: Date, indexPath: NSIndexPath?)
}
