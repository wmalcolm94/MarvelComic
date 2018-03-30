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
    var comics: [ComicModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiComics(self.setComics)
    }
    
    func setComics(_ comic: [ComicModel]?) {
        self.comics = comic
        self.collectionView?.reloadData()
    }
}

private extension ComicsViewController {
    func ComicsForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = comics else { return nil }
        guard let name = results[(indexPath as NSIndexPath).section].title else { return nil }
        return name
    }
}

extension ComicsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = comics else {
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
                                                      for: indexPath) as! ComicCell
        let comicItem = ComicsForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.titleLabel.text = comicItem
        return cell
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let results = comics else { return }
        let comic = results[(indexPath as NSIndexPath).section]
        let comicController = self.storyboard?.instantiateViewController(withIdentifier: "comicViewController") as! ComicViewController
        
        comicController.comic = comic 
        navigationController?.pushViewController(comicController, animated: true)
    }
}
