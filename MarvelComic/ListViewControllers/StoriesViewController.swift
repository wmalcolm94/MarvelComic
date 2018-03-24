//
//  SeriesViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

//
//  CreatorsViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class StoriesViewController : UICollectionViewController {
    fileprivate let reuseIdentifier = "StoryCell"
    var stories: [Story]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiStories(self.setStories)
    }
    
    func setStories(_ stories: [Story]?) {
        self.stories = stories
        self.collectionView?.reloadData()
    }
}

private extension StoriesViewController {
    func StoriesForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = stories else { return nil }
        guard let fuck = results[(indexPath as NSIndexPath).section].title else { return nil }
        return fuck
    }
}

extension StoriesViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = stories else {
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
                                                      for: indexPath) as! StoryCell
        //2
        let storyItem = StoriesForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3
        cell.titleLabel.text = storyItem
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //let url = thumbnailFileURLS[indexPath.item]
        //        if UIApplication.sharedApplication().canOpenURL(url) {
        //            UIApplication.sharedApplication().openURL(url)
        //        }
    }
}



