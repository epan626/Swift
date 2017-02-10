//
//  AddItemTableViewControllerDelegate.swift
//  bucketCrud
//
//  Created by Eric Pan on 2/9/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController )
}
