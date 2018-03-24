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
    var creators: [Creator]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCreators(self.setCreators)
    }
    
    func setCreators(_ creator: [Creator]?) {
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
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = creators else {
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
                                                      for: indexPath) as! CreatorCell
        //2
        let creatorItem = CreatorsForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3
        cell.nameLabel.text = creatorItem
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //let url = thumbnailFileURLS[indexPath.item]
        //        if UIApplication.sharedApplication().canOpenURL(url) {
        //            UIApplication.sharedApplication().openURL(url)
        //        }
    }
}
