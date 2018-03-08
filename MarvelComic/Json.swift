//
//  Json.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-07.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import Foundation

func convert(str: String) -> [String:Any]? {
    if let data = str.data(using: .utf8) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return json as? [String:Any]
        } catch {
            print("")
        }
    }
    return nil
}

//func parseJSON(dict: [String:Any]) -> Comic?
//{
//    guard 
//        let id = dict["id"] as? Int,
//        let digitalId = dict["digitalId"] as? Int,
//        let title = dict["title"] as? String,
//        let issueNumber = dict["issueNumber"] as? Int,
//        let description = dict["description"] as? String,
//        let modified = dict["modified"] as? Date
//    else {
//        print("error parsing json to Comic...")
//        return nil
//    }
//    return Comic(id: id, digitalId: digitalId, title: title, issueNumber: issueNumber, description: description, modified: modified)
//}
//
//func parseJSON(dict: [String:Any]) -> Character?
//{
//    guard 
//        let id = dict["id"] as? Int,
//        let name = dict["name"] as? String,
//        let description = dict["description"] as? String,
//        let modified = dict["modified"] as? Date
//    else {
//        print("error parsing json to Character...")
//        return nil
//    }
//    return Character(id: id, name: name, description: description, modified: modified)
//}

