//
//  Character.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-06.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import ObjectMapper

class Character: Mappable {
    var id: Int?
    var name: String?
    var description: String?
    var modified: Date?
    var thumbnail: Any?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        modified <- map["modified"]
        thumbnail <- map["thumbnail"]
    }
}
