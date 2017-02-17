//
//  ViewController.swift
//  cameraAlbum
//
//  Created by Eric Pan on 2/16/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UITableViewController, AddPhotoDelegate, ShowPhotoDelegate {

    
    @IBOutlet var myTableView: UITableView!
    
    //MARK: model's array / core data
    var photos = [MyPhoto]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: edit button pressed from showphotoviewcontroller
    
    func showPhotoButtonPressed(by controller: CustomCell) {
        let indexPath = self.tableView.indexPath(for: controller)
        performSegue(withIdentifier: "editPhotoSegue", sender: indexPath)
    }
    
    //MARK: add button pressed from addphotoviewcontroller
    func addPhotoDoneButtonPressed(by controller: UIViewController, name: String, image: NSData, date: Date, indexPath: NSIndexPath?) {
        if let index = indexPath {
           let photo = photos[index.row]
            print("hey")
           photo.image = image
           photo.name = name
           photo.date = date as NSDate
        } else {
        let myPhoto = NSEntityDescription.insertNewObject(forEntityName: "MyPhoto", into: managedObjectContext) as! MyPhoto
            print("hey2")
        myPhoto.name = name
        myPhoto.image = image
        myPhoto.date = date as NSDate
              }
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
      
        self.fetchAllItems()
        
    }

    //MARK: fetch data from coredata and pushes it to photos array
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MyPhoto")
        do {
            let result = try managedObjectContext.fetch(request)
            photos = result as! [MyPhoto]
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
    }
    
    //MARK: tableview override
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let img = photos[indexPath.row].image
        let image = UIImage(data:img as! Data, scale:2.0)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.imageNameOutlet.text = "\(photos[indexPath.row].name!)"
        cell.imageOutlet.image = image
        cell.delegate = self
        return cell
    }
    
    
    //MARK: root override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: prepare segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhotoSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addPhotoViewController2 = navigationController.topViewController as! addPhotoViewController
            addPhotoViewController2.delegate = self
        } else if segue.identifier == "editPhotoSegue" {
            let showPhotoViewController2 = segue.destination as! showPhotoViewController
            showPhotoViewController2.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let _ = photos[indexPath.row]
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM dd yyyy"
            let time = dateformatter.string(from: photos[indexPath.row].date as! Date)
            let image = UIImage(data:photos[indexPath.row].image as! Data,scale:2.0)
            
            showPhotoViewController2.name = photos[indexPath.row].name
            showPhotoViewController2.time = time
            showPhotoViewController2.image = image
            showPhotoViewController2.mvc = self
            showPhotoViewController2.indexPath = indexPath
            
        }
    }
    
    
    
    //MARK: UNWIND SEGUE
    @IBAction func unwindToMain(segue: UIStoryboardSegue){}

}

