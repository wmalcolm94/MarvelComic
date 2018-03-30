//
//  CreatorsViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class CreatorsViewController : UICollectionViewController {
    fileprivate let reuseIdentifier = "CreatorCell"
    var creators: [CreatorModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCreators(self.setCreators)
    }
    
    func setCreators(_ creator: [CreatorModel]?) {
        self.creators = creator
        self.collectionView?.reloadData()
    }
}

private extension CreatorsViewController {
    func CreatorsForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = creators else {
            return nil
        }
        guard let fuck = results[(indexPath as NSIndexPath).section].firstName else {
            return nil
        }
        return fuck
    }
}

extension CreatorsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = creators else {
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
                                                      for: indexPath) as! CreatorCell
        let creatorItem = CreatorsForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.nameLabel.text = creatorItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let results = self.creators else { return }
       let creator = results[(indexPath as NSIndexPath).section]
       let creatorController = self.storyboard?.instantiateViewController(withIdentifier: "creatorViewController") as! CreatorViewController

       creatorController.creator = creator
       navigationController?.pushViewController(creatorController, animated: true)
    }
}
