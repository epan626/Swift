//
//  ViewController.swift
//  aging
//
//  Created by Eric Pan on 2/9/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let names = ["Eric", "Charlie", "Bryan", "Max", "Tri", "David", "Andy", "Judy", "Sally", "Snickers", "Kit", "Kat"]
    @IBOutlet weak var tableView: UITableView!
    
    
    var ages = [String]()
    var counter = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        for _ in 0...counter {
            if counter != 0 {
                ages.append(String(Int(arc4random_uniform(100))+1))
                counter -= 1
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        cell.detailTextLabel?.text = String(ages[indexPath.row]) + " years old"
        return cell
    }
}
