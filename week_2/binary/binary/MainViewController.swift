//
//  ViewController.swift
//  binary
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ExtremesDelegate {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var totalSumOutlet: UILabel!
    
    var nums = [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000, 100000000000, 1000000000000, 10000000000000, 100000000000000, 1000000000000000]

    override func viewDidLoad() {
        super.viewDidLoad()
        totalSumOutlet.text = String(1111111111111111)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func minusButtonPressed(by controller: CustomCell) {
       let indexPath = self.tableView.indexPath(for: controller)
    controller.numDisplay.text = String(Int(controller.numDisplay.text!)!-nums[(indexPath?[1])!])
       totalSumOutlet.text = String(Int(totalSumOutlet.text!)!-nums[(indexPath?[1])!])
    }
    
    
    func plusButtonPressed(by controller: CustomCell) {
        let indexPath = self.tableView.indexPath(for: controller)
        controller.numDisplay.text = String(Int(controller.numDisplay.text!)!+nums[(indexPath?[1])!])
        totalSumOutlet.text = String(Int(totalSumOutlet.text!)!+nums[(indexPath?[1])!])

    }
    
    
    //MARK: TABLE VIEW PROTOCOL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.numDisplay.text = "\(nums[indexPath.row])"
        cell.delegate = self

//        totalSumOutlet.text = String(Int(totalSumOutlet.text!)!+Int(cell.numDisplay.text!)!)
        // return cell so that Table View knows what to draw in each row
        return cell
    }



}

//
