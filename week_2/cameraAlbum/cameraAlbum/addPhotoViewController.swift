//
//  addPhotoViewController.swift
//  cameraAlbum
//
//  Created by Eric Pan on 2/16/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class addPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    weak var delegate: AddPhotoDelegate?
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var imageNameOutlet: UITextField!
    var name: String?
    var image: UIImage?
    var indexPath: NSIndexPath?
    
    //MARK: replaces UIImageView picture with selected photo
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedPhoto = info[UIImagePickerControllerEditedImage] as! UIImage? {
            imageViewOutlet.image = selectedPhoto
        } else {
            print("wrong1")
        }
        dismiss(animated: true, completion: nil)
    }
    
    
   //MARK: pushes image and data over to main
    
    @IBAction func addPhotoDoneButtonPressed(_ sender: UIBarButtonItem) {
        let date = Date()
        if (imageViewOutlet.image != nil) && (imageNameOutlet.text != "") {
            if let chosenimage = UIImagePNGRepresentation(imageViewOutlet.image!) as NSData? {
                delegate?.addPhotoDoneButtonPressed(by: self, name: imageNameOutlet.text!, image: chosenimage, date: date, indexPath: indexPath)
            } else {
                print("wrong2")
            }
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
        } else if (imageViewOutlet.image == nil || imageNameOutlet.text == "") {
            let alert = UIAlertController(title: "Results", message:
                "Both image and name must be entered", preferredStyle: UIAlertControllerStyle.alert)
            alert.view.backgroundColor = UIColor.red
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)

           }
    }
    
    //MARK: starts camera
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    //MARK: Dismiss
    func dismissKeyboard(){
        imageNameOutlet.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        imageNameOutlet.resignFirstResponder()
        return true
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoCancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: overides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNameOutlet.delegate = self
        imageViewOutlet.image = image
        imageNameOutlet.text = name
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
