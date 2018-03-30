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

class SeriesViewController : UICollectionViewController {
    fileprivate let reuseIdentifier = "SeriesCell"
    var series: [SeriesModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiSeries(self.setSeries)
    }
    
    func setSeries(_ series: [SeriesModel]?) {
        self.series = series
        self.collectionView?.reloadData()
    }
}

private extension SeriesViewController {
    func SeriesForIndexPath(indexPath: IndexPath) -> String? {
        guard let results = series else { return nil }
        guard let fuck = results[(indexPath as NSIndexPath).section].title else { return nil }
        return fuck
    }
}

extension SeriesViewController {
    //1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let results = series else {
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
                                                      for: indexPath) as! SeriesCell
        //2
        let seriesItem = SeriesForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        //3
        cell.titleLabel.text = seriesItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let results = self.series else { return }
        let seriez = results[(indexPath as NSIndexPath).section]
        let seriesController = self.storyboard?.instantiateViewController(withIdentifier: "seriezViewController") as! SeriezViewController

        seriesController.series = seriez
        navigationController?.pushViewController(seriesController, animated: true)
    }
}


