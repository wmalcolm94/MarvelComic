//
//  CreatorsViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-22.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit

class EventsViewController : UICollectionViewController {
    fileprivate let reuseIdentifier = "EventCell"
    var events: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiEvents(self.setEvents)
    }
    
    func setEvents(_ event: [Event]?) {
        self.events = event
        self.collectionView?.reloadData()
    }
}

private extension EventsViewController {
    func EventsForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = events else { return nil }
        guard let fuck = results[(indexPath as NSIndexPath).section].title else { return nil }
        return fuck
    }
}

extension EventsViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = events else {
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
                                                      for: indexPath) as! EventCell
        //2
        let eventItem = EventsForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3
        cell.titleLabel.text = eventItem
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //let url = thumbnailFileURLS[indexPath.item]
        //        if UIApplication.sharedApplication().canOpenURL(url) {
        //            UIApplication.sharedApplication().openURL(url)
        //        }
    }
}

