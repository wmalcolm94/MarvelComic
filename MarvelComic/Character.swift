//
//  Character.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-06.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import Foundation

class Character {
    let id: Int
    let name: String
    let description: String
    let modified: Date
    
    init(id: Int, name: String, description: String, modified: Date) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
    }
}
