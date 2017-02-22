//
//  myPhotoCell.swift
//  myPhotos
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class myPhotoCell: UITableViewCell {
    //MARK: Data
    var delegate: mainMoreButtonDelegate?
    //MARK: Outlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleView: UILabel!
    @IBOutlet weak var mainMoreButtonOutlet: UIButton!
    
    
    //MARK: Actions
    
    @IBAction func mainMoreButtonPressed(_ sender: UIButton) {
        delegate?.mainMoreButtonPressed(by: self)
    }
    
    //MARK: Callbacks
    //MARK: TableViews
    
    
    
    
}
