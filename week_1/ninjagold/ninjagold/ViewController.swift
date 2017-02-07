//
//  ViewController.swift
//  ninjagold
//
//  Created by Eric Pan on 2/7/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    var scorekeeper:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buildingPressed(_ sender: UIButton) {
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        if sender.tag == 1{
            let score:Int = Int(arc4random_uniform(UInt32(20))+10)
            scorekeeper += score
            farmLabel.text = "You earned \(score)"
            scoreLabel.text = String(scorekeeper)
            farmLabel.isHidden = false
        }
        if sender.tag == 2{
            let score:Int = Int(arc4random_uniform(UInt32(10))+5)
            scorekeeper += score
            caveLabel.text = "You earned \(score)"
            scoreLabel.text = String(scorekeeper)
            caveLabel.isHidden = false
        }
        if sender.tag == 3{
            let score =  Int(arc4random_uniform(UInt32(5))+2)
            scorekeeper += score
            scoreLabel.text = String(scorekeeper)
            houseLabel.text = "You earned \(score)"
            houseLabel.isHidden = false
        }
        if sender.tag == 4{
            let score = Int(arc4random_uniform(UInt32(101))) - 50
            scorekeeper += score
            scoreLabel.text = String(scorekeeper)
            if score >= 0 {
                casinoLabel.text = "You earned \(score)"
                casinoLabel.isHidden = false
            } else {
                casinoLabel.text = "You loss \(score)"
                casinoLabel.isHidden = false
            }
        }
        if sender.tag == 5{
            scorekeeper = 0
            scoreLabel.text = String(scorekeeper)
        }
    }

}

