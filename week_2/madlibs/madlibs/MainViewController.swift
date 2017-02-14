//
//  ViewController.swift
//  madlibs
//
//  Created by Eric Pan on 2/13/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ComposeViewDelegate {
    internal func submitButtonPressed(by controller: UIViewController) {
        
    }


    @IBOutlet weak var sentenceOutlet: UILabel!
    
    var dataRecevied: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MainViewController = segue.destination
        let controller = MainViewController as! ComposeViewController
        controller.delegate = self
    }
    
    func submitButtonPressed(by controller: UIViewController, text: String, text1: String, text2: String, text3: String){
        sentenceOutlet.text = "\(text)\(text1)\(text2)\(text3)"
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){

    }
    
    
    
}


