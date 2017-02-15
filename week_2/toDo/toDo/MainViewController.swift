//
//  ViewController.swift
//  toDo
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UITableViewController, AddItemDelegate {
    
    var Task = [Tasks]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //MARK: TABLE VIEW
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.titleLabel.text = "\(Task[indexPath.row].title!)"
        cell.contentLabel.text = "\(Task[indexPath.row].text!)"
        cell.dateLabel.text = "\(Task[indexPath.row].date!)"
        if Task[indexPath.row].status == false {
            cell.accessoryType = .none
        } else if Task[indexPath.row].status == true {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                Task[indexPath.row].status = false
                do {
                    try managedObjectContext.save()
                } catch {
                    print("\(error)")
                }
            } else {
                cell.accessoryType = .checkmark
                Task[indexPath.row].status = true
                do {
                    try managedObjectContext.save()
                } catch {
                    print("\(error)")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.count
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
            let result = try managedObjectContext.fetch(request)
            Task = result as! [Tasks]
            
//            for x in 0...result.count-1 {
//                let task = result[x] as! Tasks
//                titles.append(task.title!)
//                content.append(task.text!)
//                date.append(task.date! as Date)
//                status.append(task.status)
//            }
            
        } catch {
        print("\(error)")
        }
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MainViewController = segue.destination
        let controller = MainViewController as! AddItemViewController
        controller.delegate = self
    }
    
    func addItemButtonPressed(by controller: UIViewController, title: String, text: String, date: Date, status: Bool) {
        let data = NSEntityDescription.insertNewObject(forEntityName: "Tasks", into: managedObjectContext) as! Tasks
        data.title = title
        data.text = text
        data.date = date as NSDate?
        data.status = status
        do {
            try managedObjectContext.save()
             self.fetchAllItems()
        } catch {
            print("\(error)")
        }
       
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){}


}

