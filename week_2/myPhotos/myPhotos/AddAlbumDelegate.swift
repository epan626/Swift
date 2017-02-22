//
//  AddAlbumDelegate.swift
//  myPhotos
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol AddAlbumDelegate: class {
    func addAlbumSaveButtonPressed(by: UIViewController, title: String, image: NSData)
}
