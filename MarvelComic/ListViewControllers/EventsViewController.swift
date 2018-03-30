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
    var events: [EventModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiEvents(self.setEvents)
    }
    
    func setEvents(_ event: [EventModel]?) {
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
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = events else {
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
                                                      for: indexPath) as! EventCell
        let eventItem = EventsForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.titleLabel.text = eventItem
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath) {
        guard let results = self.events else { return }
        let even = results[(indexPath as NSIndexPath).section]
        let eventController = self.storyboard?.instantiateViewController(withIdentifer: "eventViewController") as! EventViewController 

        eventController.event = even
        navigationController?.pushViewController(eventController, animated: true)
    }
}

