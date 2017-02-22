//
//  AddNotesBackDelegate.swift
//  notesExam
//
//  Created by Eric Pan on 2/21/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

protocol AddNotesBackDelegate: class {
    func AddNotesBackButtonPressed(controller: UIViewController, text: String)
}
