//
//  AddAlbumController.swift
//  myPhotos
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//


import UIKit

class AddAlbumController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    //MARK: Data
    
    
    //MARK: Outlets
    weak var AddAlbumDelegate: AddAlbumDelegate?
    @IBOutlet weak var addAlbumImageView: UIImageView!
    @IBOutlet weak var addAlbumTitleOutlet: UITextField!

    
    //MARK: Root Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        addAlbumTitleOutlet.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Helper
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let selectedPhoto = info[UIImagePickerControllerEditedImage] as! UIImage? {
            addAlbumImageView.image = selectedPhoto
        } else {
            print("Wrong1")
    }
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Actions
    
    // activates camera
    @IBAction func addAlbumCameraButtonPressed(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func addAlbumImageButtonPressed(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func addAlbumSaveButtonPressed(_ sender: UIButton) {
        if (addAlbumImageView.image != nil && addAlbumTitleOutlet.text != "") {
            if let chosenImage =  UIImagePNGRepresentation(addAlbumImageView.image!) as NSData? {
                AddAlbumDelegate?.addAlbumSaveButtonPressed(by: self, title: addAlbumTitleOutlet.text!, image: chosenImage)
                self.performSegue(withIdentifier: "unwindToMain", sender: self)
            } else {
                print("Wrong2")
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Both image and title must be entered", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        
    }
    
    //MARK: Callbacks
    
    
    //MARK: TableViews
    
    
    //MARK: Dismiss
    func dismissKeyboard(){
        addAlbumTitleOutlet.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addAlbumTitleOutlet.resignFirstResponder()
        return true
    }
    
    
}

