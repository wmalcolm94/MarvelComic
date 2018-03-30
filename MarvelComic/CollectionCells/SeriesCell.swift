//
//  SeriesCell.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class SeriesCell : UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var series: SeriesModel? {
        didSet {
            guard let series = series else { return }
            
            //guard let title = event.title else { return }
            titleLabel.text = series.title
        }
    }
}
