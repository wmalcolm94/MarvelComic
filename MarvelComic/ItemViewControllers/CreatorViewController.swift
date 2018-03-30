//
//  CreatorViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-24.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit 
import CoreData

class CreatorViewController : UIViewController { 
    var creator: CreatorModel?
    var creators: [NSManagedObject] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelApi.apiCreator(id: 1111, self.setCreator)
    }
    
    func setCreator(_ create: CreatorModel?) {
        creator = create
        guard let firstName = creator?.firstName else { return }
        guard let lastName = creator?.lastName else { return }
        nameLabel.text = firstName + " " + lastName
        descriptionText.text = "N/A"
    }

    func findCreator() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Creator")
        guard let id = creator?.id else { return }
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate

        do {
            creators = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    func save(id: Int) {
        guard let appDelegaet = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegaet.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Creator", in: managedContext)
        let create = NSManagedObject(entity: entity!, insertInto: managedContext)
        create.setValue(id, forKeyPath: "id")

        do {
            try managedContext.save()
            creators.append(create)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
