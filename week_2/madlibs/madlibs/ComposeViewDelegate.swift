//
//  ComposeViewDelegate.swift
//  madlibs
//
//  Created by Eric Pan on 2/13/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol ComposeViewDelegate: class {
    func submitButtonPressed(by controller: UIViewController, text: String, text1: String, text2: String, text3: String)
}
