//
//  CustomCell.swift
//  binary
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
class CustomCell: UITableViewCell {
    
    weak var delegate: ExtremesDelegate?
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var numDisplay: UILabel!
    
    var indexPath: NSIndexPath?
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        delegate?.minusButtonPressed(by: self)
//        numDisplay.text =  String(Int(numDisplay.text!)!-Int(numDisplay.text!)!)
        
    }

    @IBAction func plusButtonPressed(_ sender: UIButton) {
        delegate?.plusButtonPressed(by: self)
//        numDisplay.text =  String(Int(numDisplay.text!)!+Int(numDisplay.text!)!)
    }
    
    
}
