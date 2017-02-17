//
//  CustomCell.swift
//  cameraAlbum
//
//  Created by Eric Pan on 2/16/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    weak var delegate: ShowPhotoDelegate?
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var imageNameOutlet: UILabel!

    @IBAction func showButtonPressed(_ sender: UIButton) {
        delegate?.showPhotoButtonPressed(by: self)
    }
    
}
