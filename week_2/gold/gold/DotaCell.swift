//
//  DotaCells.swift
//  gold
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit


class DotaCell: UITableViewCell {
    
    var addGoldDelegate: AddGoldDelegate?
    
    //MARK: Outlets
    
    @IBOutlet weak var dotaAmountLabel: UILabel!
    @IBOutlet weak var dotaImageView: UIImageView!
    @IBOutlet weak var dotaCountLabel: UILabel!
    @IBOutlet weak var dotaNameLabel: UILabel!
    
    //MARK: Actions
    
    @IBAction func dotaGobuttonPressed(_ sender: UIButton) {
        _model?.count += 1
        dotaCountLabel.text = "click count: \((_model?.count)!)"
        
        var b = false
        var min = 0
        var max = 0
        
        
        if _model?.name == "Bounty" {
            min = 60
            max = 101
        } else if _model?.name == "Rat" {
            min = 100
            max = 201
        } else if _model?.name == "Gank" {
            min = 200
            max = 601
        } else {
            min = 0
            max = 2
            b = true
        }
        
        addGoldDelegate?.addToTotalGold(num: Int(arc4random_uniform(UInt32(max - min))) + min, battle: b)
    }

    
    //MARK: Helper
    
    func populateInfo(){
        dotaImageView.image = _model?.image
        dotaCountLabel.text = "click count: \((_model?.count)!)"
        dotaNameLabel.text = _model?.name
        if _model?.name == "Bounty" {
            dotaAmountLabel.text = "+50-100"
        } else if _model?.name == "Rat" {
            dotaAmountLabel.text = "+100-200"
        } else if _model?.name == "Gank" {
            dotaAmountLabel.text = "+200-600"
        } else {
            dotaAmountLabel.text = "+/- 15%"
        }
    }
    
    
    
    //MARK: Model
    private var _model : Character?
    
        var model: Character {
    
            set {
                _model = newValue
                populateInfo()
            
            }
            get {
                return _model!
            }
    }

}
