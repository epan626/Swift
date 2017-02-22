//
//  AddPhotoController.swift
//  myPhotos
//
//  Created by Eric Pan on 2/20/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData


class AddPhotoController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    //MARK: Data
    weak var delegate: AddPhotoDelegate?
     let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var album = Album()
    
    //MARK: Outlets
    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var addPhotoTitleLabel: UITextField!
    
    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        addPhotoTitleLabel.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: Helper
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let selectedPhoto = info[UIImagePickerControllerEditedImage] as! UIImage? {
            addPhotoImageView.image = selectedPhoto
        } else {
            print("Wrong1")
        }
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func addPhotoSavedButtonPressed(_ sender: UIButton) {
        let date = Date()
        if (addPhotoImageView.image != nil) {
            if let chosenImage = UIImagePNGRepresentation(addPhotoImageView.image!) as NSData? {
                let newPhoto = NSEntityDescription.insertNewObject(forEntityName: "Photos", into: managedObjectContext) as! Photos
                newPhoto.title = addPhotoTitleLabel.text
                newPhoto.image = chosenImage
                newPhoto.createdAt = date as NSDate
                let photoAlbum = self.album.photos?.mutableCopy() as! NSMutableOrderedSet
                photoAlbum.add(newPhoto)
                self.album.photos = photoAlbum.copy() as? NSOrderedSet
                do {
                    try managedObjectContext.save()
                    self.performSegue(withIdentifier: "unwindToPhotoCollection", sender: self)
                    print("Success!")
                } catch {
                    print("\(error)")
                }
                delegate?.addPhotoSavedButtonPressed(controller: self)
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "An image must be entered", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    


    // activates camera
    @IBAction func addPhotoCameraButtonPressed(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func addPhotoImageButtonPressed(_ sender: UIButton) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.allowsEditing = true
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.delegate = self
//        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    //MARK: Callbacks
    //MARK: TableViews
    //MARK: Dismiss
    func dismissKeyboard(){
        addPhotoTitleLabel.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addPhotoTitleLabel.resignFirstResponder()
        return true
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoCancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    
}
