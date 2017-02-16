//
//  EditDbzController.swift
//  mydbz
//
//  Created by Eric Pan on 2/15/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//


import UIKit

class EditDbzController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: EditDbzDelegate?
    var name: String?
    var descript: String?
    var special: String?
    var image: UIImage?
    var indexPath: NSIndexPath?
    var chosenimage: NSData?
    
    @IBOutlet weak var dbzEditImageOutlet: UIImageView!
    @IBOutlet weak var dbzEditNameOutlet: UITextField!
    @IBOutlet weak var dbzEditDescriptOutlet: UITextField!
    @IBOutlet weak var dbzEditSpecialOutlet: UITextField!
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if let chosenimage = UIImagePNGRepresentation(dbzEditImageOutlet.image!) as NSData? {
        delegate?.doneButtonPressed(by: self, name: dbzEditNameOutlet.text!, description: dbzEditDescriptOutlet.text!, special: dbzEditSpecialOutlet.text!, image: chosenimage, atIndexPath: indexPath)
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
        } else {
            print("wrong1")
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        delegate?.deleteButtonPressed(by: self, atIndexPath: indexPath)
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage {
        dbzEditImageOutlet.image = selectedPhoto
        } else {
            print("wrong")
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func changePictureButtonPressed(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            dbzEditNameOutlet.text = name
            dbzEditDescriptOutlet.text = descript
            dbzEditSpecialOutlet.text = special
            dbzEditImageOutlet.image = image

        }
    
}


