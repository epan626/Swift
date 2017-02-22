//
//  ViewController.swift
//  notesExam
//
//  Created by Eric Pan on 2/21/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNotesBackDelegate, EditNotesBackDelegate, UISearchResultsUpdating, UISearchBarDelegate {
  
    //MARK: Data
    var notes = [Notes]()
    var filteredNotes = [Notes]()
    var shouldShowSearchResults = false
    
    var searchController = UISearchController(searchResultsController: nil)
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //MARK: Outlets
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!

    //MARK: Actions
//    func searchBar(searchBBar: UISearchBar, textdidChange searchText: String) {
//        filteredNotes = notes.filtered { note in
//            return notes[indexPath.row]
//    }
    func updateSearchResults(for searchController: UISearchController) {
//        let searchString = searchController.searchBar.text
//        
        // Filter the data array and get only those countries that match the search text.
//        filteredNotes = notes.filter({ (text) -> Bool in
//            let noteText: NSString = text as
//            
//            return (noteText.rangeOfString(searchString, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
//        })
    
        // Reload the tableview.
//        myTableView.reloadData()
    }

    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        print("sup")
        myTableView.reloadData()
    }
    
    
    //MARK: Callbacks
    func AddNotesBackButtonPressed(controller: UIViewController, text: String) {
            let date = Date()
            if text != "" {
                let newNote = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: managedObjectContext) as! Notes
            newNote.createdAt = date as NSDate
            newNote.text = text
            do {
                try managedObjectContext.save()
            } catch {
            print("\(error)")
            }
            } else {
            print("nope")
        }
        self.fetchAllItems()
    }
    
    func EditBackButtonPressed(controller: UIViewController, text: String, indexPath: NSIndexPath) {
        let date = Date()
        if text != "" {
            let note = notes[indexPath.row]
            managedObjectContext.delete(note)
            notes.remove(at: indexPath.row)
            let newNote = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: managedObjectContext) as! Notes
            newNote.createdAt = date as NSDate
            newNote.text = text
            do {
                try managedObjectContext.save()
            } catch {
                print("\(error)")
            }
        } else {
            print("nope")
        }
        self.fetchAllItems()
        }

    
    
    //MARK: Root Overrides
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

    
    //MARK: TableViews
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredNotes.count
        } else {
        return notes.count
    }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        if shouldShowSearchResults {
            let date = filteredNotes[indexPath.row].createdAt
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let dateString = dateFormatter.string(from: date as! Date)
            cell.notesTitleOutlet.text! = filteredNotes[indexPath.row].text!
            cell.notesDetailOutlet.text! = dateString
        } else {
            let date = notes[indexPath.row].createdAt
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let dateString = dateFormatter.string(from: date as! Date)
            cell.notesTitleOutlet.text! = notes[indexPath.row].text!
            cell.notesDetailOutlet.text! = dateString
        }
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editNotesSegue", sender: indexPath)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        managedObjectContext.delete(note)
        do {
            try managedObjectContext.save()
             notes.remove(at: indexPath.row)
        } catch {
           print("\(error)")
        }
        self.fetchAllItems()
    }
    
    
    
    //MARK: Fetch
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        do {
            let result = try managedObjectContext.fetch(request)
            notes = result as! [Notes]
            notes.reverse()
        } catch {
            print("\(error)")
        }
        myTableView.reloadData()
    }
    
    
    

    
    //MARK: SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNotesSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addNotesViewController = navigationController.topViewController as! AddNotesViewController
            addNotesViewController.delegate = self

        }  else if segue.identifier == "editNotesSegue" {
            let navigationController = segue.destination as! UINavigationController
            let editNotesViewController = navigationController.topViewController as! EditNotesViewController
            editNotesViewController.delegate = self
            let indexPath = sender as! NSIndexPath
            editNotesViewController.indexPath = indexPath
            editNotesViewController.content = notes[indexPath.row].text!
    }
    
    
    

}
}

