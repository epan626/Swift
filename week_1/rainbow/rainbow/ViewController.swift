//
//  ViewController.swift
//  rainbow
//
//  Created by Eric Pan on 2/9/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let arr = [UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.00), UIColor(red:0.99, green:0.50, blue:0.14, alpha:1.00), UIColor(red:1.00, green:0.99, blue:0.22, alpha:1.00), UIColor(red:0.16, green:0.99, blue:0.18, alpha:1.00), UIColor(red:0.04, green:0.14, blue:0.98, alpha:1.00), UIColor(red:0.50, green:0.06, blue:0.49, alpha:1.00)]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            cell.contentView.backgroundColor = arr[indexPath.row]
        return cell
       
    }
    
}
