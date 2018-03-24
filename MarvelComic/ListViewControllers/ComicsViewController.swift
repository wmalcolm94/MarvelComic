//
//  ComicsViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class ComicsViewController : UICollectionViewController {
    fileprivate let reuseIdentifier = "ComicCell"
    var comics: [Comic]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiComics(self.setComics)
    }
    
    func setComics(_ comic: [Comic]?) {
        self.comics = comic
        self.collectionView?.reloadData()
    }
}

private extension ComicsViewController {
    func ComicsForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = comics else {
            return nil
        }
        guard let name = results[(indexPath as NSIndexPath).section].title else {
            return nil
        }
        return name
    }
}

extension ComicsViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = comics else {
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
                                                      for: indexPath) as! ComicCell
        //2
        let comicItem = ComicsForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3
        cell.titleLabel.text = comicItem
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //let url = thumbnailFileURLS[indexPath.item]
        //        if UIApplication.sharedApplication().canOpenURL(url) {
        //            UIApplication.sharedApplication().openURL(url)
        //        }
    }
}
