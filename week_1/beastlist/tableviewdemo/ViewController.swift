//
//  ViewController.swift
//  tableviewdemo
//
//  Created by Eric Pan on 2/9/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var taskTextfield: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var arr = ["one", "two", "three"]
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        arr.append(taskTextfield.text!)
        tableView.reloadData()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TABLE VIEW PROTOCOL
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = self.arr[indexPath.row]
        
        return cell
    }
    
}



