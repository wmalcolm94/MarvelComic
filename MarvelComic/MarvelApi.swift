//
//  MarvelApi.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-06.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

final class MarvelApi {
    let base: String = "https://gateway.marvel.com:443/v1/public/"
    static let key: String? = generateHash()
    let date = 1
    
    private static func generateHash() -> String? {
        let dumb = 1
        let publicKey: String = "3f0f2b65c4f991264ccaa01f416fa462"
        let privateKey: String = "9bedea7ebde0ab7c75d5f6525a8550b1bcadc8c1"
        let urlKey = String(dumb) + privateKey + publicKey
        let data = urlKey.data(using: .utf8)
        let theKey: String
        if let hash = data?.md5.hexString {
            theKey = "?apikey=\(publicKey)&hash=\(hash)&ts=\(dumb)"
        } else {
            theKey = "broken"
        }
        return theKey
    }
    
    static func apiCharacters(_ onSuccess: @escaping ([Character]?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/characters" + theKey
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let characterResponse = response.result.value {
                if let characterResults = characterResponse.data?.characters {
                    onSuccess(characterResults)
                }
            }
        }
    }

    static func apiCharacter(id: Int, _ onSuccess: @escaping (Character?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/characters/\(id)\(theKey)"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            guard let characterResponse = response.result.value else { return }
            guard let characterResults = characterResponse.data?.characters else { return }
            onSuccess(characterResults[0])
        }
    }
    
    static func apiComics(_ onSuccess: @escaping ([Comic]?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/comics" + theKey
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let comicsResponse = response.result.value {
                if let comicResults = comicsResponse.data?.comics {
                    onSuccess(comicResults)
                }
            }
        }
    }
    
    static func apiComic(id: Int, _ onSuccess: @escaping (Comic?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/comics/\(id)\(theKey)"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            guard let comicResponse = response.result.value else { return }
            guard let comicResults = comicResponse.data?.comics else { return }
            onSuccess(comicResults[0])
        }
    }
    
    static func apiCreators(_ onSuccess: @escaping ([Creator]?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/creators" + theKey
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let creatorsResponse = response.result.value {
                if let creatorResults = creatorsResponse.data?.creators {
                    onSuccess(creatorResults)
                }
            }
        }
    }
    
    static func apiCreator(id: Int, _ onSuccess: @escaping (Creator?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/creators/\(id)\(theKey)"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            guard let creatorResponse = response.result.value else { return }
            guard let creatorResults = creatorResponse.data?.creators else { return }
            onSuccess(creatorResults[0])
        }
    }
    
    static func apiEvents(_ onSuccess: @escaping ([Event]?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/events" + theKey
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let eventsResponse = response.result.value {
                if let eventResults = eventsResponse.data?.events {
                    onSuccess(eventResults)
                }
            }
        }
    }
    
    static func apiEvent(id: Int, _ onSuccess: @escaping (Event?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/events/\(id)\(theKey)"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            guard let eventResponse = response.result.value else { return }
            guard let eventResults = eventResponse.data?.events else { return }
            onSuccess(eventResults[0])
        }
    }
    
    static func apiSeries(_ onSuccess: @escaping ([Series]?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/series" + theKey
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let seriesResponse = response.result.value { 
                if let seriesResults = seriesResponse.data?.series {
                    onSuccess(seriesResults)
                }
            }
        }
    }
    
    static func apiSeries(id: Int, _ onSuccess: @escaping (Series?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/series\(id)\(theKey)"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            guard let seriesResponse = response.result.value else { return }
            guard let seriesResults = seriesResponse.data?.series else { return }
            onSuccess(seriesResults[0])
        }
    }
    
    static func apiStories(_ onSuccess: @escaping ([Story]?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/stories" + theKey
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let storiesResponse = response.result.value {
                if let storiesResults = storiesResponse.data?.stories { 
                    onSuccess(storiesResults)
                }
            }
        }
    }

    static func apiStory(id: Int, _ onSuccess: @escaping (Story?) -> () ) {
        guard let theKey = key else { return }
        let url = "https://gateway.marvel.com:443/v1/public/stories/\(id)\(theKey)"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            guard let storyResponse = response.result.value else { return }
            guard let storyResults = storyResponse.data?.stories else { return }
            onSuccess(storyResults[0])
        }
    }
    
    
//    private func md5(string: String) -> Data {
//        let messageData = string.data(using:.utf8)!
//        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
//        
//        _ = digestData.withUnsafeMutableBytes {digestBytes in
//            messageData.withUnsafeBytes {messageBytes in
//                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
//            }
//        }
//        return digestData
//    }
}
