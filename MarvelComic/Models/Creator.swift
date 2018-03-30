//
//  Creator.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-08.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import ObjectMapper

class CreatorModel: Mappable {
    var id: Int?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var thumbnail: Any?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["firstName"]
        middleName <- map["middleName"]
        lastName <- map["lastName"]
        thumbnail <- map["thumbnail"]
    }
}
