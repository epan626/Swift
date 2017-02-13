//
//  ViewController.swift
//  NESW
//
//  Created by Eric Pan on 2/13/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, backButtonDelegate {

    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "northSegue", sender: sender)
    }

    
    
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
        let controller = MainViewController as! DisplayViewController
        controller.direction = sender as! UIButton
        controller.delegate = self
    }
    
    func backButtonPressed(by controller: UIViewController) {
        
    }
    
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){}
    

}

