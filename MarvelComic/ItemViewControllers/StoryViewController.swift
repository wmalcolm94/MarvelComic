//
//  StoryViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-25.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class StoryViewController : UIViewController {
    var story: Story?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiStory(id: 1111, self.setStory)
    }
    
    func setStory(_ storie: Story?) {
        self.story = storie
        titleLabel.text = self.story?.title
        descriptionText.text = self.story?.description
    }
}
