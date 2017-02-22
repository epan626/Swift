//
//  EditPhotoController.swift
//  myPhotos
//
//  Created by Eric Pan on 2/20/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit
import CoreData

class EditPhotoController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Data
    weak var delegate: EditPhotoDelegate?
    var thisPhoto = Photos()
    var indexPath: NSIndexPath?
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //MARK: Outlets
    @IBOutlet weak var editPhotoImageView: UIImageView!
    @IBOutlet weak var editPhotoTitleOutlet: UITextField!
    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        editPhotoTitleOutlet.text = thisPhoto.title
        if let thisImage = UIImage(data:thisPhoto.image as! Data) {
            editPhotoImageView.image = thisImage
        }
    }
    
    
    
    
    //MARK: Actions
    @IBAction func editPhotoSavedButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.editPhotoSavedButtonPressed(controller: self)
        if (editPhotoImageView.image != nil) {
            self.thisPhoto.title = editPhotoTitleOutlet.text
            if let img = UIImagePNGRepresentation(editPhotoImageView.image!) as NSData? {
               self.thisPhoto.image = img
            }
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editPhotoCancelledButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    //sets background as taken photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let selectedPhoto = info[UIImagePickerControllerEditedImage] as! UIImage? {
            editPhotoImageView.image = selectedPhoto
        } else {
            print("Wrong1")
        }
        dismiss(animated: true, completion: nil)
    }
    
    // activates camera
    @IBAction func editPhotoImageButtonPressed(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func editPhotoCameraButtonPressed(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    //MARK: Callbacks
    //MARK: TableViews
    
}
