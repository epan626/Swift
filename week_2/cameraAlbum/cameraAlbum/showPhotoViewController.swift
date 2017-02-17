//
//  showPhotoViewController.swift
//  cameraAlbum
//
//  Created by Eric Pan on 2/16/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class showPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AddPhotoDelegate {
    
    weak var delegate: ShowPhotoDelegate?
    var name: String?
    var time: String?
    var image: UIImage?
    var indexPath: NSIndexPath?
    var mvc: MainViewController?
    
    @IBOutlet weak var showPhotoImageOutlet: UIImageView!
    @IBOutlet weak var showPhotoNameOutlet: UILabel!
    @IBOutlet weak var showPhotoTimeOutlet: UILabel!
    @IBAction func showPhotoBackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "addPhotoSegue", sender: indexPath)
    }
    
    func addPhotoDoneButtonPressed(by controller: UIViewController, name: String, image: NSData, date: Date, indexPath: NSIndexPath?) {
 
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainview = mvc!
        let navigationController = segue.destination as! UINavigationController
        let addPhotoViewController = navigationController.topViewController as! addPhotoViewController
        addPhotoViewController.delegate = mainview
        
            let indexPath = sender as! NSIndexPath
            addPhotoViewController.name = name
            addPhotoViewController.image = image
            addPhotoViewController.indexPath = indexPath
            
        }
    
    //MARK: Root override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPhotoNameOutlet.text = name
        showPhotoTimeOutlet.text = time
        showPhotoImageOutlet.image = image
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
