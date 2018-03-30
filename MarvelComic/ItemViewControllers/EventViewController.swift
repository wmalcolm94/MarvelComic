//
//  EventViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit
import CoreData

class EventViewController : UIViewController {
    var event: EventModel? 
    var events: [NSManagedObject] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiEvent(id: 227, self.setEvent)
    }
    
    func setEvent(_ event: EventModel?) {
        self.event = event
        titleLabel.text = self.event?.title
        descriptionText.text = self.event?.description
    }

    func findEvent() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Event")
        guard let id = event?.id else { return }
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate
        
        do {
            events = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch, \(error), \(error.userInfo)")
        }
    }

    func save(id: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext 
        let entity = NSEntityDescription.entity(forEntityName: "Event", in: managedContext)
        let event = NSManagedObject(entity: entity!, insertInto: managedContext)
        event.setValue(id, forKeyPath: "id")

        do {
            try managedContext.save()
            events.append(event)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
