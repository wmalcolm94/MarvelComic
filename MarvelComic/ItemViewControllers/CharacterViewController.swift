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
    
    @IBOutlet weak var backButton: UINavigationItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        MarvelApi.apiCharacter(id: 1010354, self.setCharacter) //Adam Warlock ID
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationItem.title = "Back"
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        navigationItem.title = nil
//        let vc = segue.destination as UIViewController
//        vc.navigationItem.title = "Characters Controller"
//        navigationItem.title = "Back"
//
//    }
    
    func setCharacter(_ char: Character?) {
        self.character = char
        nameLabel.text = self.character?.name
        descriptionText.text = self.character?.description
    }
}
