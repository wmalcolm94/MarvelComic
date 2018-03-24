//
//  CreatorCell.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class EventCell : UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var event: Event? {
        didSet {
            guard let event = event else { return }
            
            //guard let title = event.title else { return }
            titleLabel.text = event.title
        }
    }
}
