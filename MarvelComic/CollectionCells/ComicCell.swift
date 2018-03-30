//
//  ComicCell.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class ComicCell : UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var comic: ComicModel? {
        didSet {
            guard let comic = comic else { return }
            titleLabel.text = comic.title
            //ratingImageView.image = image(forRating: player.rating)
        }
    }
}

