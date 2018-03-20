//
//  CharacterViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-11.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class CharacterViewController : UITableViewController {
    var characters = MarvelApi.getCharacters()
}

extension CharacterViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters!.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell",
                                                 for: indexPath) as! CharacterCell
        
        let character = characters![indexPath.row]
        cell.character = character
        return cell
    }
}


