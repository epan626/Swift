//
//  ViewController.swift
//  numbergame
//
//  Created by Eric Pan on 2/8/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var random:Int = 0

    @IBOutlet weak var inputBox: UITextField!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if inputBox.text! == "" {
        print(inputBox.text!)
            print("here")
        } else {
            print(random)
            print(inputBox.text!)
            if Int(inputBox.text!) == random {
                inputBox.text = ""
                // create the alert
                let alert = UIAlertController(title: "Congrats!!", message: "\(random) was the correct number!", preferredStyle: UIAlertControllerStyle.alert)
                alert.view.backgroundColor = UIColor.green

                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Play again?", style: UIAlertActionStyle.default, handler:  { action in
                    self.restart()
                }))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            else if Int(inputBox.text!)! > random {
                            inputBox.text = ""
                let alert = UIAlertController(title: "Wrong", message: "You guessed too high! Try again", preferredStyle: UIAlertControllerStyle.alert)
                    alert.view.backgroundColor = UIColor.red
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Guess again?", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
                
            else if Int(inputBox.text!)! < random {
                inputBox.text = ""
                let alert = UIAlertController(title: "Wrong", message: "You guessed too low! Try again", preferredStyle: UIAlertControllerStyle.alert)
                alert.view.backgroundColor = UIColor.yellow
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Guess again?", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }

            }
    }
    
    func restart () {
        random = Int(arc4random_uniform(100) + 1)
    }
    
    override func viewDidLoad() {
            random = Int(arc4random_uniform(100) + 1)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

