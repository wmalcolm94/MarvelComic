//
//  ComicViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit
import CoreData

class ComicViewController : UIViewController {
    var comic: ComicModel?
    var comics: [NSManagedObject] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiComic(id: 21478, self.setComic)
    }
    
    func setComic(_ comic: ComicModel?) {
        self.comic = comic
        titleLabel.text = self.comic?.title
        descriptionText.text = self.comic?.description
    }

    func findComic() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Comic")
        guard let id = comic?.id else { return }
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate

        do {
            comics = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print ("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    func save(id: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Comic", in: managedContext)
        let comic = NSManagedObject(entity: entity!, insertInto: managedContext)
        comic.setValue(id, forKeyPath: "id")

        do {
            try managedContext.save()
            comics.append(comic)
        } catch let error as NSError {
            print("COuld not save. \(error), \(error.userInfo)")
        }
    }
}
