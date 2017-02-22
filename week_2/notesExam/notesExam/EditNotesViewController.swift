//
//  EditNotesViewController.swift
//  notesExam
//
//  Created by Eric Pan on 2/21/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class EditNotesViewController: UIViewController {
    
    //MARK: Data
    weak var delegate: EditNotesBackDelegate?
    var indexPath: NSIndexPath?
    var content: String?
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: Outlets
    @IBOutlet weak var editNotesTextViewOutlet: UITextView!
    
    
    //    var noteText : String = addNotesTextViewOutlet.text
    
    //MARK: Actions
    @IBAction func backEditButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.EditBackButtonPressed(controller: self, text: editNotesTextViewOutlet.text, indexPath: indexPath!)
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: Callbacks
    //MARK: TableViews
    
    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        editNotesTextViewOutlet.text = content
        //        self.navigationItem.hidesBackButton = true
        //        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddNotesViewController.back(sender:)))
        //        self.navigationItem.leftBarButtonItem = newBackButton
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    let date = Date()
    //    if addNotesTextViewOutlet.text != "" {
    //    let newNote = NSEntityDescription.insertNewObject(forEntityName: "Notes", into: managedObjectContext) as! Notes
    //    newNote.createdAt = date as NSDate
    //    newNote.text = addNotesTextViewOutlet.text
    //    do {
    //    try managedObjectContext.save()
    //    delegate?.AddNotesBackButtonPressed(controller: self)
    //    dismiss(animated: true, completion: nil)
    //    print("here")
    //    } catch {
    //    print("\(error)")
    //    }
    //
    //    _ = navigationController?.popViewController(animated: true)
    //    } else {
    //    dismiss(animated: true, completion: nil)
    //    }
    
    
    
}

