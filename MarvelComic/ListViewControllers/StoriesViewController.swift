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
    var stories: [StoryModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiStories(self.setStories)
    }
    
    func setStories(_ stories: [StoryModel]?) {
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
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = stories else {
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
                                                      for: indexPath) as! StoryCell
        let storyItem = StoriesForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.titleLabel.text = storyItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let results = self.stories else { return }
        let story = results[(indexPath as NSIndexPath).section]
        let storyController = self.storyboard?.instantiateViewController(withIdentifier: "storyViewController") as! StoryViewController

        storyController.story = story
        navigationController?.pushViewController(storyController, animated: true)
    }
}



