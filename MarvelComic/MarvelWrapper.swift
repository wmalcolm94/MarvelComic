//
//  MarvelWrapper.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-08.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//
import ObjectMapper

class MarvelWrapper: Mappable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: MarvelData?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        copyright <- map["copyright"]
        attributionText <- map["attributionText"]
        attributionHTML <- map["attributionHTML"]
        etag <- map["etag"]
        data <- map["data"]
    }
}
