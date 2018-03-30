//
//  Story.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-08.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import ObjectMapper

class StoryModel: Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var type: String?
    var thumbnail: Any?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        type <- map["type"]
        thumbnail <- map["thumbnail"]
    }
}
