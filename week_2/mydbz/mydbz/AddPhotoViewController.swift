//
//  AddPhotoViewController.swift
//  mydbz
//
//  Created by Eric Pan on 2/15/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//


import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: AddPhotoDelegate?
    
    @IBOutlet weak var dbzNameOutlet: UITextField!
    @IBOutlet weak var dbzDescriptionOutlet: UITextField!
    @IBOutlet weak var dbzSpecialOutlet: UITextField!
    @IBOutlet weak var dbzImageOutlet: UIImageView!
    
    @IBAction func addDbzButtonPressed(_ sender: UIButton) {
        if let chosenimage = UIImagePNGRepresentation(dbzImageOutlet.image!) as NSData? {
        delegate?.addDbzButtonPressed(by: self, name: dbzNameOutlet.text!, description: dbzDescriptionOutlet.text!, special: dbzSpecialOutlet.text!, image: chosenimage)
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
        } else {
            print("wrong1")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage? {
        dbzImageOutlet.image = selectedPhoto
        } else {
            print("wrong2")
        }
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func addPhotoFromLibraryButtonPressed(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func dbzHomeButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    
}
