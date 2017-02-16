//
//  ViewController.swift
//  demo
//
//  Created by Eric Pan on 2/15/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstViewController viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstViewController viewWillAppear")
    }
}

