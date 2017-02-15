//
//  AddItemViewController.swift
//  toDo
//
//  Created by Eric Pan on 2/14/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    weak var delegate: AddItemDelegate?
    @IBOutlet weak var titleInputOutlet: UITextField!
    
    @IBOutlet weak var contentInputOutlet: UITextField!
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        delegate?.addItemButtonPressed(by: self, title: titleInputOutlet.text!, text: contentInputOutlet.text!, date: datePickerOutlet.date, status: false)
        
        print(titleInputOutlet.text!)
        print(contentInputOutlet.text!)
        print(datePickerOutlet.date)
        self.performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


