//
//  CreatorCell.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class CreatorCell : UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var creator: Creator? {
        didSet {
            guard let creator = creator else { return }
            
            guard let firstName = creator.firstName else { return }
            guard let lastName = creator.lastName else { return }
            nameLabel.text = firstName + " " + lastName
        }
    }
}
