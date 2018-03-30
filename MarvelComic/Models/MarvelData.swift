//
//  MarvelData.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-08.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import ObjectMapper 

class MarvelData: Mappable {
    //actual marvel data info
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    //var results: [Character]?
    
    //for the various options that results can be.
    var characters: [CharacterModel]?
    var comics: [ComicModel]?
    var creators: [CreatorModel]?
    var events: [EventModel]?
    var series: [SeriesModel]?
    var stories: [StoryModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        offset      <- map["offset"]
        limit       <- map["limit"]
        total       <- map["total"]
        count       <- map["count"]
        characters  <- map["results"]
        comics      <- map["results"]
        creators    <- map["results"]
        events      <- map["results"]
        series      <- map["results"]
        stories     <- map["results"]
        //self.evaluateResults()
    }
    
//    func evaluateResults() {
//        if results is [Character]? {
//            characters = results as? [Character] 
//        }
//        if results is [Comic]? {
//            comics = results as? [Comic]
//        }
//        if results is [Creator]? {
//            creators = results as? [Creator]
//        }
//        if results is [Event]? {
//            events = results as? [Event]
//        }
//        if results is [Series]? {
//            series = results as? [Series]
//        }
//        if results is [Story]? {
//            stories = results as? [Story]
//        }
//    }
}
