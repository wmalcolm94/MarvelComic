//
//  ComicViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class ComicViewController : UIViewController {
    var comic: Comic?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiComic(id: 21478, self.setComic)
    }
    
    func setComic(_ comic: Comic?) {
        self.comic = comic
        titleLabel.text = self.comic?.title
        descriptionText.text = self.comic?.description
    }
}
