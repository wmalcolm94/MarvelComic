//
//  CreatorViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit 

class CreatorViewController : UIViewController { 
    var creator: Creator?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCreator(id: 1111, self.setCreator)
    }
    
    func setCreator(_ create: Creator?) {
        creator = create
        guard let firstName = creator?.firstName else { return }
        guard let lastName = creator?.lastName else { return }
        nameLabel.text = firstName + " " + lastName
        descriptionText.text = "N/A"
    }
}
