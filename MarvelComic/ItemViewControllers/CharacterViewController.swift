//
//  CharacterViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-23.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit 

class CharacterViewController : UIViewController {
    var character: Character?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCharacter(id: 1010354, self.setCharacter) //Adam Warlock ID
    }
    
    func setCharacter(_ char: Character?) {
        self.character = char
        nameLabel.text = self.character?.name
        descriptionText.text = self.character?.description
    }
}
