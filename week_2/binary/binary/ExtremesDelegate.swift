//
//  extremesDelegate.swift
//  binary
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol ExtremesDelegate: class {
    func minusButtonPressed(by controller: CustomCell)
    func plusButtonPressed(by controller: CustomCell)
}
