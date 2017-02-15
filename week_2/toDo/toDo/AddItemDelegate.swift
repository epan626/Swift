//
//  AddItemDelegate.swift
//  toDo
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol AddItemDelegate: class {
    func addItemButtonPressed(by controller: UIViewController, title: String, text: String, date: Date, status: Bool)
}
