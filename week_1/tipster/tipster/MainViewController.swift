//
//  ViewController.swift
//  tipster
//
//  Created by Eric Pan on 2/7/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var sum = ""
    var disableButton = false
    var disableCalc:Int = 0
    
    @IBAction func keyButtonPressed(_ sender: UIButton) {
        if sender.tag == 10 {
            sum = ""
            totalOutlet.text = "$0"
            disableButton = false
            disableCalc = 0
            lowTip.text = "0"
            midTip.text = "0"
            highTip.text = "0"
            lowTipTotal.text = "0"
            midTipTotal.text = "0"
            highTipTotal.text = "0"

            
        }
        if disableButton == true && sender.tag != 11{
            disableCalc += 1
        }
        if disableCalc < 3 {
            if sender.tag == 0 {
                if sum.characters.count != 0 {
                    sum += "0"
                } else {
                    print("Pressing 0")
                }
                
                
            }
            else if sender.tag == 1 {
                sum += "1"
            }
            else if sender.tag == 2 {
                sum += "2"
            }
            else if sender.tag == 3 {
                sum += "3"
            }
            else if sender.tag == 4 {
                sum += "4"
            }
            else if sender.tag == 5 {
                sum += "5"
            }
            else if sender.tag == 6 {
                sum += "6"
            }
            else if sender.tag == 7 {
                sum += "7"
            }
            else if sender.tag == 8 {
                sum += "8"
            }
            else if sender.tag == 9 {
                sum += "9"
            }
            else if sender.tag == 11 {
                if disableButton == false {
                    if sum.characters.count > 0 {
                       sum += "."
                    } else {
                        sum += "0."
                    }
                     disableButton = true
                    
                    
                } else {
                    print("Pressing . ")
                }
            }
            if sum.characters.count > 0 && sum.characters.last != "."{
                calculator(number: String(sum)!)
            }
        }
        
        

    };
    
     var currentValue = Int()
    var currentSize:Int = 1
    
    @IBAction func tipSlider(_ sender: UISlider) {
        currentValue = Int(sender.value)
        lowPercent.text = "\((currentValue)-10)%"
        medPercent.text = "\((currentValue)-5)%"
        highPercent.text = "\(currentValue)%"
        if sum.characters.count > 0 {
            lowTip.text = String(format: "%.2f", ((Float(currentValue) - Float(10)) * Float(sum)!)/Float(100)/Float(currentSize))
            midTip.text = String(format: "%.2f", (((Float(currentValue) - Float(5)) * Float(sum)!)/Float(100))/Float(currentSize))
            highTip.text = String(format: "%.2f", (((Float(currentValue)) * Float(sum)!)/Float(100))/Float(currentSize))
            lowTipTotal.text = String(format: "%.2f", ((Float(currentValue) - Float(10)) * Float(sum)!)/Float(100)+Float(sum)!/Float(currentSize))
            midTipTotal.text = String(format: "%.2f", (((Float(currentValue) - Float(5)) * Float(sum)!)/Float(100))+Float(sum)!/Float(currentSize))
            highTipTotal.text = String(format: "%.2f", (((Float(currentValue)) * Float(sum)!)/Float(100))+Float(sum)!/Float(currentSize))
        }
    }
    
    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBAction func sizeSlider(_ sender: UISlider) {
        currentSize = Int(sender.value)
        sizeOutlet.text = String(Int(sender.value))
        if sum.characters.count > 0 {
            lowTip.text = String(format: "%.2f", (((Float(currentValue) - Float(10)) * Float(sum)!)/Float(100))/Float(currentSize))
            midTip.text = String(format: "%.2f", (((Float(currentValue) - Float(5)) * Float(sum)!)/Float(100))/Float(currentSize))
            highTip.text = String(format: "%.2f", (((Float(currentValue)) * Float(sum)!)/Float(100))/Float(currentSize))
            lowTipTotal.text = String(format: "%.2f", ((Float(currentValue) - Float(10)) * Float(sum)!)/Float(100)+Float(sum)!/Float(currentSize))
            midTipTotal.text = String(format: "%.2f", (((Float(currentValue) - Float(5)) * Float(sum)!)/Float(100))+Float(sum)!/Float(currentSize))
            highTipTotal.text = String(format: "%.2f", (((Float(currentValue)) * Float(sum)!)/Float(100))+Float(sum)!/Float(currentSize))

        }
            }
    
    func calculator(number: String){
        let total:Double = Double(tipSliderOutlet.value) * Double(number)!
        totalOutlet.text = "$\(number)"
        lowTip.text = String(format: "%.2f", (((Float(currentValue) - Float(10)) * Float(sum)!)/Float(100))/Float(currentSize))
        midTip.text = String(format: "%.2f", (((Float(currentValue) - Float(5)) * Float(sum)!)/Float(100))/Float(currentSize))
        highTip.text = String(format: "%.2f", (((Float(currentValue)) * Float(sum)!)/Float(100))/Float(currentSize))
        lowTipTotal.text = String(format: "%.2f", ((Float(currentValue) - Float(10)) * Float(sum)!)/Float(100)+Float(sum)!/Float(currentSize))
        midTipTotal.text = String(format: "%.2f", (((Float(currentValue) - Float(5)) * Float(sum)!)/Float(100))+Float(sum)!/Float(currentSize))
        highTipTotal.text = String(format: "%.2f", (((Float(currentValue)) * Float(sum)!)/Float(100))+Float(sum)!/Float(currentSize))
    }

    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var tipSliderOutlet: UISlider!
    @IBOutlet weak var lowPercent: UILabel!
    @IBOutlet weak var medPercent: UILabel!
    @IBOutlet weak var highPercent: UILabel!
    @IBOutlet weak var lowTip: UILabel!
    @IBOutlet weak var midTip: UILabel!
    @IBOutlet weak var highTip: UILabel!
    @IBOutlet weak var lowTipTotal: UILabel!
    @IBOutlet weak var midTipTotal: UILabel!
    @IBOutlet weak var highTipTotal: UILabel!
    @IBOutlet weak var sizeOutlet: UILabel!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lowPercent.text = "10%"
        medPercent.text = "15%"
        highPercent.text = "20%"
        totalOutlet.text = "$0"
        lowTip.text = "0"
        midTip.text = "0"
        highTip.text = "0"
        lowTipTotal.text = "0"
        midTipTotal.text = "0"
        highTipTotal.text = "0"
        currentValue = 20
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

