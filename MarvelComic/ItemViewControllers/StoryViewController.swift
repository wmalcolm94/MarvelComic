//
//  StoryViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-25.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit
import CoreData

class StoryViewController : UIViewController {
    var story: StoryModel?
    var stories: [NSManagedObject] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiStory(id: 1111, self.setStory)
    }
    
    func setStory(_ storie: StoryModel?) {
        self.story = storie
        titleLabel.text = self.story?.title
        descriptionText.text = self.story?.description
    }

    func findStory() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Story")
        guard let id = story?.id else { return }
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate
        
        do {
            stories = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func save(id: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Story", in: managedContext)
        let storie = NSManagedObject(entity: entity!, insertInto: managedContext)
        storie.setValue(id, forKeyPath: "id")
        
        do {
            try managedContext.save()
            stories.append(storie)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
