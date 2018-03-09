//
//  MarvelData.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-08.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import ObjectMapper 

class MarvelData: Mappable {
    var offset: Int? //"offset": 0,
    var limit: Int? //"limit": 20,
    var total: Int? //"total": 1,
    var count: Int? //"count": 1,
    var results: [Comic]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}
