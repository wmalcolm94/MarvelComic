//
//  SeriezViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class SeriezViewController : UIViewController {
    var series: Series?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiSeries(id: 1111, self.setSeries)
    }
    
    func setSeries(_ seriez: Series?) {
        self.series = seriez
        titleLabel.text = self.series?.title
        descriptionText.text = self.series?.description
    }
}
