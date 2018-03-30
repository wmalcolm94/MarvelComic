//
//  StoryCell.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class StoryCell : UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var story: StoryModel? {
        didSet {
            guard let story = story else { return }
            
            //guard let title = event.title else { return }
            titleLabel.text = story.title
        }
    }
}
