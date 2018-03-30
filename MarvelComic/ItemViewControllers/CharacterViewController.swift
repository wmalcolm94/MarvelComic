//
//  CharacterViewController.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-23.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import UIKit 
import CoreData

class CharacterViewController : UIViewController {
    var character: CharacterModel?
    var chars: [NSManagedObject] = []

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        guard let id = character?.id else { return }
        MarvelApi.apiCharacter(id: id, self.setCharacter) //Adam Warlock ID
    }
    
    @IBAction func favouriteClick(_ sender: UIButton) {
        guard let id = character?.id else { return }
        self.save(id: id)
    }
    
    func setCharacter(_ char: CharacterModel?) {
        self.character = char
        nameLabel.text = self.character?.name
        descriptionText.text = self.character?.description
        
        self.findCharacter()
    }
    
    func findCharacter() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Character")
        guard let id = character?.id else  { return }
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate
        
        do {
            chars = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func save(id: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Character", in: managedContext)
        let char = NSManagedObject(entity: entity!, insertInto: managedContext)
        char.setValue(id, forKeyPath: "id")
        
        do {
            try managedContext.save()
            chars.append(char)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
