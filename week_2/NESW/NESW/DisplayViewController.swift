//
//  DisplayViewController.swift
//  NESW
//
//  Created by Eric Pan on 2/13/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    var direction = UIButton()
    var direc = String()
    weak var delegate: backButtonDelegate?
    
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        delegate?.backButtonPressed(by: self)
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
    }
 
    
    
//    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
//        print("uhm")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(direction.tag)
        if direction.tag == 1 {
            direc = "north"
        }
        else if direction.tag == 2 {
            direc = "east"
        }
        else if direction.tag == 3 {
            direc = "south"
        }
        else if direction.tag == 4 {
            direc = "west"
        }
        backButtonOutlet.setTitle(direc, for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
