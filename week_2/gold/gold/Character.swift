//
//  Characters.swift
//  gold
//
//  Created by Eric Pan on 2/17/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class Character {
    var name: String
    var image: UIImage
    var count: Int = 0
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}
