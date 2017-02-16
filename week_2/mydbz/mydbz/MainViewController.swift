//
//  ViewController.swift
//  mydbz
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UICollectionViewController, AddPhotoDelegate, EditDbzDelegate {

    @IBOutlet weak var MyCollectionView: UICollectionView!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.MyCollectionView.delegate = self
        self.MyCollectionView.dataSource = self
        self.fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var characters = [Character]()
    
    func addDbzButtonPressed(by controller: UIViewController, name: String, description: String, special: String, image: NSData) {
        let character = NSEntityDescription.insertNewObject(forEntityName: "Character", into: managedObjectContext) as! Character
        character.name = name
        character.descript = description
        character.special = special
        character.image = image
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        self.fetchAllItems()
    }
    
    func doneButtonPressed(by controller: UIViewController, name: String, description: String, special: String, image: NSData, atIndexPath: NSIndexPath?) {
        if let ip = atIndexPath {
            characters[ip.row].name = name
            characters[ip.row].descript = description
            characters[ip.row].special = special
            characters[ip.row].image =  image
            collectionView?.reloadData()
        }
        
    }
    func deleteButtonPressed(by controller: UIViewController, atIndexPath: NSIndexPath?) {
        let character = characters[(atIndexPath?.row)!]
        managedObjectContext.delete(character)
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        characters.remove(at: (atIndexPath?.row)!)
        self.fetchAllItems()
    }
    


    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Character")
        do {
            let result = try managedObjectContext.fetch(request)
            characters = result as! [Character]
        } catch {
            print("\(error)")
        }
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let title = characters[indexPath.row].name
        
        let img = characters[indexPath.row].image
        
        cell.myImageView.image = UIImage(data:img as! Data,scale:2.0)
        cell.imageNameOutlet.text = title
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editDBZ", sender: indexPath)
    }

    
    //MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDBZ" {
            let navigationController = segue.destination as! UINavigationController
            let addPhotoViewController = navigationController.topViewController as! AddPhotoViewController
            addPhotoViewController.delegate = self
        } else if segue.identifier == "editDBZ" {
            let navigationController = segue.destination as! UINavigationController
            let editDbzController = navigationController.topViewController as! EditDbzController
            editDbzController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let character = characters[indexPath.row]
            editDbzController.name = character.name
            editDbzController.descript = character.descript
            editDbzController.special = character.special
            
            
            editDbzController.image = UIImage(data:character.image as! Data,scale:2.0)
            editDbzController.indexPath = indexPath

        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){}
}

