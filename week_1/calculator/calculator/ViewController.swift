//
//  ViewController.swift
//  calculator
//
//  Created by Eric Pan on 2/8/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberInput = ""
    var numberInput2 = ""
    var numberOne = ""
    var disableButton = false
    var operation = ""
    var extreme = false
    
    @IBOutlet weak var totalOutlet: UILabel!
    
    @IBAction func keyButtonPressed(_ sender: UIButton) {
        if sender.tag == 11 {
            numberInput = ""
            numberOne = ""
            operation = ""
            totalOutlet.text = "0"
            disableButton = false
            extreme = false
        }
        if sender.tag <= 10 {
            if sender.tag == 0 {
                numberInput += "0"
            }
            else if sender.tag == 1 {
                numberInput += "1"
            }
            else if sender.tag == 2 {
                numberInput += "2"
            }
            else if sender.tag == 3 {
                numberInput += "3"
            }
            else if sender.tag == 4 {
                numberInput += "4"
            }
            else if sender.tag == 5 {
                numberInput += "5"
            }
            else if sender.tag == 6 {
                numberInput += "6"
            }
            else if sender.tag == 7 {
                numberInput += "7"
            }
            else if sender.tag == 8 {
                numberInput += "8"
            }
            else if sender.tag == 9 {
                numberInput += "9"
            }
            else if sender.tag == 10 {
                if disableButton == false {
                    numberInput += "."
                    disableButton = true
                }
            }
                totalOutlet.text = numberInput

        } else {
            if sender.tag == 12 {
                if numberInput != "" && numberInput != "0" {
                    if extreme == false {
                        extreme = true
                        totalOutlet.text = String(Int(numberInput)! * -1)
                        numberInput = totalOutlet.text!
                    } else {
                        extreme = false
                        totalOutlet.text = String(abs(Int(numberInput)!))
                        numberInput = totalOutlet.text!
                    }
 
                } else {
                    if extreme == false {
                        extreme = true
                        totalOutlet.text = "-0"
                        numberInput = totalOutlet.text!
                    } else {
                        extreme = false
                        totalOutlet.text = String(abs(Int(numberInput)!))
                        numberInput = totalOutlet.text!
                    }
                }
                            }
            else if sender.tag == 13 {
                if numberInput != "" && numberInput != "0" {
                    totalOutlet.text = String(Float(numberInput)! / 100)
                    numberInput = totalOutlet.text!
                } else {
                    print("no")
                }
                
            }
            else if sender.tag == 14 {
                if numberInput.characters.count > 0 && operation != "/" {
                    if numberOne == "" {
                        numberOne += numberInput
                        operation = "/"
                        totalOutlet.text = numberInput
                        numberInput = ""
                    } else {
                        if numberOne != "" {
                            totalOutlet.text = String(Int(numberOne)!/Int(numberInput)!)
                            numberOne = String(Int(numberOne)!/Int(numberInput)!)
                            operation = ""
                        }
                    }
                }
            }
            else if sender.tag == 15 {
                if numberInput.characters.count > 0 && operation != "*"{
                    if numberOne == "" {
                        numberOne += numberInput
                        operation = "*"
                        totalOutlet.text = numberInput
                        numberInput = ""
                    } else {
                        if numberOne != "" {
                            totalOutlet.text = String(Int(numberOne)!*Int(numberInput)!)
                            numberOne = String(Int(numberOne)!*Int(numberInput)!)
                            operation = ""
                        }
                    }
                }
            }
            else if sender.tag == 16 {
                if numberInput.characters.count > 0 && operation != "-"{
                    if numberOne == "" {
                        numberOne += numberInput
                        operation = "-"
                        totalOutlet.text = numberInput
                        numberInput = ""
                    } else {
                        if numberOne != "" {
                            totalOutlet.text = String(Int(numberOne)!-Int(numberInput)!)
                            numberOne = String(Int(numberOne)!-Int(numberInput)!)
                            operation = ""
                        }
                    }
                }
            }
            else if sender.tag == 17 {
                if numberInput.characters.count > 0 && operation != "+"{
                    if numberOne == "" {
                        numberOne += numberInput
                        operation = "+"
                        totalOutlet.text = numberInput
                        numberInput = ""
                    } else {
                        if numberOne != "" {
                            totalOutlet.text = String(Int(numberOne)!+Int(numberInput)!)
                            numberOne = String(Int(numberOne)!+Int(numberInput)!)
                            operation = ""
                        }
                    }
                }
            }
            else if sender.tag == 18 {
                if numberInput != "" && numberOne != "" {
                    if operation == "+" {
                        totalOutlet.text = String(Int(numberOne)!+Int(numberInput)!)
                        numberInput = totalOutlet.text!
                        numberOne = ""
                        operation = ""
                    }
                    else if operation == "-" {
                        totalOutlet.text = String(Int(numberOne)!-Int(numberInput)!)
                        numberInput = totalOutlet.text!
                        numberOne = ""
                        operation = ""
                    }
                    else if operation == "*" {
                        totalOutlet.text = String(Int(numberOne)!*Int(numberInput)!)
                        numberInput = totalOutlet.text!
                        numberOne = ""
                        operation = ""
                    }
                    else if operation == "/" {
                        totalOutlet.text = String(Int(numberOne)!/Int(numberInput)!)
                        numberInput = totalOutlet.text!
                        numberOne = ""
                        operation = ""
                    }
                    
                }
            }
        }
        
  
        
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

