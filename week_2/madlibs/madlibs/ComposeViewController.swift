//
//  composeViewController.swift
//  madlibs
//
//  Created by Eric Pan on 2/13/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    weak var delegate: ComposeViewDelegate?
    
    
    
    @IBOutlet var inputTextOutlets: [UITextField]!

    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        delegate?.submitButtonPressed(by: self, text: inputTextOutlets[0].text!, text1: inputTextOutlets[1].text!, text2: inputTextOutlets[2].text!, text3: inputTextOutlets[3].text!)
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
