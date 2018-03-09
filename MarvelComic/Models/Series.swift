//
//  Series.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-08.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import ObjectMapper

class Series: Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var startYear: Int?
    var endYear: Int?
    var previous: Series?
    var next: Series?
    var thumbnail: Any?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        startYear <- map["startYear"]
        endYear <- map["endYear"]
        previous <- map["previous"]
        next <- map["next"]
    }
}
