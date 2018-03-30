//
//  CharacterViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-11.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class CharactersViewController : UICollectionViewController {
    fileprivate let reuseIdentifier = "CharacterCell"
    var characters: [CharacterModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCharacters(self.setCharacters)
    }
    
    func setCharacters(_ char: [CharacterModel]?) {
        self.characters = char
        self.collectionView?.reloadData()
    }
}

private extension CharactersViewController {
    func characterForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = characters else { return nil }
        guard let name = results[(indexPath as NSIndexPath).section].name else { return nil }
        return name
    }
}

extension CharactersViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = characters else {
            return 1
        }
        return results.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! CharacterCell
        let characterItem = characterForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.nameLabel.text = characterItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let results = self.characters else { return }
        let character = results[(indexPath as NSIndexPath).section]
        let characterController = self.storyboard?.instantiateViewController(withIdentifier: "characterViewController") as! CharacterViewController

        characterController.character = character
        navigationController?.pushViewController(characterController, animated: true)
    }
}
