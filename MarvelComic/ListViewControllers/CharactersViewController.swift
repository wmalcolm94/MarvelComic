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
    var characters: [Character]?
    
//    var characterIndexPath: NSIndexPath? {
//        didSet {
//            //2
//            var indexPaths = [IndexPath]()
//            if let characterIndexPath = characterIndexPath {
//                indexPaths.append(characterIndexPath as IndexPath)
//            }
//            if let oldValue = oldValue {
//                indexPaths.append(oldValue as IndexPath)
//            }
//            //3
//            collectionView?.performBatchUpdates({
//                self.collectionView?.reloadItems(at: indexPaths)
//            }) { completed in
//                //4
//                if let characterIndexPath = self.characterIndexPath {
//                    self.collectionView?.scrollToItem(
//                        at: characterIndexPath as IndexPath,
//                        at: .centeredVertically,
//                        animated: true)
//                }
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCharacters(self.setCharacters)
    }
    
    func setCharacters(_ char: [Character]?) {
        self.characters = char
        self.collectionView?.reloadData()
    }
}

private extension CharactersViewController {
    func characterForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = characters else {
            return nil
        }
        guard let name = results[(indexPath as NSIndexPath).section].name else {
            return nil
        }
        return name
    }
}

extension CharactersViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = characters else {
            return 1
        }
        return results.count
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! CharacterCell
        //2
        let characterItem = characterForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3
        cell.nameLabel.text = characterItem
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //let url = thumbnailFileURLS[indexPath.item]
//        if UIApplication.sharedApplication().canOpenURL(url) {
//            UIApplication.sharedApplication().openURL(url)
//        }
    }
}
