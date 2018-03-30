//
//  SeriezViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit
import CoreData

class SeriezViewController : UIViewController {
    var series: SeriesModel?
    var seriez: [NSManagedObject] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = series?.id else { return }
        MarvelApi.apiSeries(id: id, self.setSeries)
    }
    
    func setSeries(_ seriez: SeriesModel?) {
        self.series = seriez
        titleLabel.text = self.series?.title
        descriptionText.text = self.series?.description
    }

    func findSeries() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Series")
        guard let id = series?.id else { return }
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate

        do {
            seriez = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
