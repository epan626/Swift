//
//  ViewController.swift
//  myPhotos
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData


class MainViewController: UITableViewController, AddAlbumDelegate, mainMoreButtonDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Data
    var album = [Album]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedIP: NSIndexPath?
    var selectedPhoto: UIImage?
    //MARK: Outlets
    @IBOutlet var myTableView: UITableView!
    
    
    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.fetchAllItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    //MARK: Actions
    //MARK: Fetch
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        do {
            let result = try managedObjectContext.fetch(request)
            album = result as! [Album]
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
    }
    
    
    //MARK: Callbacks
    func addAlbumSaveButtonPressed(by: UIViewController, title: String, image: NSData) {
        let date = Date()
        let newAlbum = NSEntityDescription.insertNewObject(forEntityName: "Album", into: managedObjectContext) as! Album
        newAlbum.title = title
        newAlbum.image = image
        newAlbum.createdAt = date as NSDate
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        self.fetchAllItems()
    }
    
    func mainMoreButtonPressed(by controller: myPhotoCell) {
        let indexPath = self.tableView.indexPath(for: controller)
        let thisAlbum = album[(indexPath?.row)!]
        performSegue(withIdentifier: "photoCollectionSegue", sender: thisAlbum)
    }
    
    
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAlbumSegue" {
            let addAlbumController  = segue.destination as! AddAlbumController
            addAlbumController.AddAlbumDelegate = self
        } else if segue.identifier == "photoCollectionSegue" {
            let navigationController = segue.destination as! UINavigationController
            let photoCollectionController = navigationController.topViewController as! photoCollectionController
            photoCollectionController.album = sender as! Album
            photoCollectionController.MoreDelegate = self
            
        }
    }
    
    //MARK: Unwind Segue
    @IBAction func unwindToMain(segue: UIStoryboardSegue){}
    
    
    //MARK: TableViews
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let img = album[indexPath.row].image
        let image = UIImage(data:img as! Data)
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myPhotoCell", for: indexPath) as! myPhotoCell
        cell.mainImageView.image = image
        cell.mainTitleView.text = album[indexPath.row].title!
        cell.delegate = self
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIP = indexPath as NSIndexPath?
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        selectedIP = indexPath as NSIndexPath
        present(imagePickerController, animated: true, completion: nil )
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
            print("more button tapped")
        }
        more.backgroundColor = .lightGray
        return [more]
    }
    func quicksave() {
        let thisAlbum = album[(selectedIP?.row)!] 
        let date = Date()
        if (selectedPhoto != nil) {
            if let chosenImage = UIImagePNGRepresentation(selectedPhoto!) as NSData? {
                let newPhoto = NSEntityDescription.insertNewObject(forEntityName: "Photos", into: managedObjectContext) as! Photos
                newPhoto.image = chosenImage
                newPhoto.createdAt = date as NSDate
                let photoAlbum = thisAlbum.photos?.mutableCopy() as! NSMutableOrderedSet
                photoAlbum.add(newPhoto)
                thisAlbum.photos = photoAlbum.copy() as? NSOrderedSet
                do {
                    try managedObjectContext.save()
                    self.performSegue(withIdentifier: "unwindToPhotoCollection", sender: self)
                    print("Success!")
                } catch {
                    print("\(error)")
            }
        }
        performSegue(withIdentifier: "photoCollectionSegue", sender: thisAlbum)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        selectedPhoto = info[UIImagePickerControllerEditedImage] as! UIImage?
        dismiss(animated: true, completion: { self.quicksave() })
    }
}

}


    
    
    
    // CODE TO DELETE DATA FROM CORE DATA
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photos")
//    
//    // Create Batch Delete Request
//    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//    
//    do {
//    try managedObjectContext.execute(batchDeleteRequest)
//    
//    } catch {
//    // Error Handling
//    }
// ============================================
    



