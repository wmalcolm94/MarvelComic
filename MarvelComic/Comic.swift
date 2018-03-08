//
//  Comic.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-06.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//
import ObjectMapper

class Comic: Mappable {
    var id: Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Int?
    var description: String?
    var modified: Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        digitalId <- map["digitalId"]
        title <- map["title"]
        issueNumber <- map["issueNumber"]
        description <- map["description"]
        modified <- map["modified"]
    }
}
