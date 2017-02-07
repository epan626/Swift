//
//  ViewController.swift
//  coldcall
//
//  Created by Eric Pan on 2/7/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!

    var names = ["Eric", "Charlie", "Judy"]
    
    var counter = 0
    var number = Int()
    
    @IBAction func callButtonPressed(_ sender: UIButton) {
        counter = Int(arc4random_uniform(UInt32(names.count)))
        number = Int(arc4random_uniform(UInt32(5))+1)
        if number == 1 || number == 2{
            numberLabel.textColor = UIColor.red
        }
        if number == 3 || number == 4{
            numberLabel.textColor = UIColor.yellow
        }
        
        if number == 5 || number == 0 {
            numberLabel.textColor = UIColor.green
        }
        updateUI()
    }
    
    func updateUI(){
        nameLabel.text = names[counter]
        numberLabel.text = String(number)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Ready?"
        numberLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

