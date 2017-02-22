//
//  photoCollectionController.swift
//  myPhotos
//
//  Created by Eric Pan on 2/19/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class photoCollectionController: UICollectionViewController, AddPhotoDelegate, EditPhotoDelegate {
    //MARK: Data
    var album = Album()
    var photos = [Photos]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var MoreDelegate: mainMoreButtonDelegate?
    
    //MARK: Outlets
    @IBOutlet var PhotoCollectionView: UICollectionView!
    
    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAllItems()

    }
    //MARK: Actions
    
    @IBAction func photoCollectionBackButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Fetch 
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Photos")
        do {
            let result = try managedObjectContext.fetch(request)
            photos = result as! [Photos]
        } catch {
            print("\(error)")
        }
        collectionView?.reloadData()
    }
    
    //MARK: Callbacks
    func addPhotoSavedButtonPressed(controller: UIViewController) {
        self.fetchAllItems()
    }
    func editPhotoSavedButtonPressed(controller: UIViewController) {
        self.fetchAllItems()
    }
    
    //MARK: CollectionViews
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.photos!.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCells", for: indexPath) as! PhotoCollectionViewCell
        let myPhoto = album.photos?[indexPath.row] as! Photos
        cell.PhotoCollectionImageView.image = UIImage(data:myPhoto.image as! Data, scale:2.0)
        cell.PhotoCollectionImageTitle.text = myPhoto.title as String!
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editPhotoSegue", sender: indexPath)
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhotoSegue" {
            let addPhotoController = segue.destination as! AddPhotoController
            addPhotoController.delegate = self
            addPhotoController.album = album
        } else if segue.identifier == "editPhotoSegue" {
            let navigationController = segue.destination as! UINavigationController
            let editPhotoController = navigationController.topViewController as! EditPhotoController
            editPhotoController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let thisPhoto = album.photos![indexPath.row] as! Photos
            editPhotoController.thisPhoto = thisPhoto
            editPhotoController.indexPath = indexPath
            
        }
    }
    
    //MARK: Unwind Segue
    @IBAction func unwindToPhotoCollection(segue: UIStoryboardSegue){}
    
}
