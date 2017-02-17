//
//  MainViewController.swift
//  gold
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddGoldDelegate {
    
    //MARK: Data
    var charactersArray = [Character]()
    var gold = 0
    
    //MARK: Outlets
    @IBOutlet weak var goldLabelOutlet: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersArray.append(Character(name:"Bounty", image: UIImage(named: "bounty")!))
        charactersArray.append(Character(name:"Rat", image: UIImage(named: "rat")!))
        charactersArray.append(Character(name:"Gank", image: UIImage(named: "gank")!))
        charactersArray.append(Character(name:"Battle", image: UIImage(named: "battle")!))
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Callbacks
    func addToTotalGold(num: Int, battle: Bool) {
        if battle {
            if num == 1 {
               gold += Int(Double(gold)*0.15)
            } else {
                gold -= Int(Double(gold)*0.15)
            }
            
        } else {
            gold += num
            
        }
        goldLabelOutlet.text = "Gold:\(gold)"
    }

    
    //MARK: Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Instantiate the cell
        let cell = myTableView.dequeueReusableCell(withIdentifier: "DotaCell") as! DotaCell
        
        //Set data
        cell.model = charactersArray[indexPath.row]
        cell.addGoldDelegate = self
        
        
        return cell
    }
    



}

