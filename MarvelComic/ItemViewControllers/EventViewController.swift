//
//  EventViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class EventViewController : UIViewController {
    var event: Event? 
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiEvent(id: 227, self.setEvent)
    }
    
    func setEvent(_ event: Event?) {
        self.event = event
        titleLabel.text = self.event?.title
        descriptionText.text = self.event?.description
    }
}
