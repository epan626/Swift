//
//  File.swift
//  demo
//
//  Created by Eric Pan on 2/15/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController viewWillAppear")
    }
}
