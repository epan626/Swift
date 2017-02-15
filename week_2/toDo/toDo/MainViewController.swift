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
    
    var titles = [String]()
    var content = [String]()
    var date = [Date]()
    
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.titleLabel.text = "\(titles[indexPath.row])"
        cell.contentLabel.text = "\(content[indexPath.row])"
        cell.dateLabel.text = "\(date[indexPath.row])"
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
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
            for x in 0...result.count-1 {
                let task = result[x] as! Tasks
                titles.append(task.title!)
                content.append(task.text!)
                date.append(task.date! as Date)
            }
            
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

