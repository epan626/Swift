//
//  EditDbzDelegate.swift
//  mydbz
//
//  Created by Eric Pan on 2/15/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol EditDbzDelegate: class {
    func doneButtonPressed(by controller: UIViewController, name: String, description: String, special: String, image: NSData, atIndexPath: NSIndexPath?)
    func deleteButtonPressed(by controller: UIViewController, atIndexPath: NSIndexPath?)
}
