//
//  AddGoldDelegate.swift
//  gold
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol AddGoldDelegate: class {
    func addToTotalGold(num: Int, battle: Bool)
}
