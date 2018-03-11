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

class MarvelApi {
    let base: String    //https://gateway.marvel.com:443/v1/public/comics?apikey=3f0f2b65c4f991264ccaa01f416fa462
    let publicKey: String = "3f0f2b65c4f991264ccaa01f416fa462"
    let privateKey: String = "9bedea7ebde0ab7c75d5f6525a8550b1bcadc8c1"
    let key: String 
    let date: Int

    init () {
        base = "https://gateway.marvel.com:443/v1/public/"
        date = 1
        let urlKey = String(date) + privateKey + publicKey
        let data = urlKey.data(using: .utf8)
        if let hash = data?.md5.hexString {
            key = "?apikey=\(publicKey)&hash=\(hash)&ts=\(date)"
        } else {
            key = "broken"
        }
    }
    
    public func getCharacters() -> [Character]? {
        let url: String = base + "characters/" + key
        var characters: [Character]? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in 
            if let characterResponse = response.result.value {
                if let characterResults = characterResponse.data?.results {
                    //characters = characterResults
                }
            }
        }
        return characters
    }
    
    public func getCharacter(id: Int) -> Character? {
        let url: String = base + "characters/\(id)" + key
        var character: Character? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let characterResponse = response.result.value {
                if let characterResults = characterResponse.data?.results {
                    //character = characterResults[0]
                }
            }
        }
        return character
    }
    
    public func getComics() -> [Comic]? {
        let url: String = base + "comics" + key
        var comics: [Comic]? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let comicResponse = response.result.value {
                if let comicResults = comicResponse.data?.results {
                    //comics = comicResults
                }
            }
        }
        return comics
    }
    
    public func getComic(id: Int) -> Comic? {
        let url: String = base + "comics/\(id)" + key
        var comic: Comic? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let comicResponse = response.result.value {
                if let comicResults = comicResponse.data?.results {
                    //comic = comicResults[0]
                }
            } 
        }
        return comic
    }
    
    public func getCreators() -> [Creator]? {
        let url: String = base + "creators/" + key
        var creators: [Creator]? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let creatorsResponse = response.result.value {
                if let creatorsResults = creatorsResponse.data?.results {
                    //creators = creatorsResults
                }
            }
        }
        return creators
    }
    
    public func getCreator(id: Int) -> Creator? {
        let url: String = base + "creators/\(id)" + key
        var creator: Creator? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let creatorResponse = response.result.value {
                if let creatorResult = creatorResponse.data?.results {
                    //creator = creatorResults[0]
                }
            }
        }
        return creator
    }
    
    public func getEvents() -> [Event]? {
        let url: String = base + "events/" + key
        var events: [Event]? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let eventsResponse = response.result.value {
                if let eventsResult = eventsResponse.data?.results {
                    //events = eventsResult
                }
            }
        }
        return events
    }
    
    public func getEvent(id: Int) -> Event? {
        let url: String = base + "events/\(id)" + key
        var event: Event? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let eventsResponse = response.result.value {
                if let eventsResult = eventsResponse.data?.results {
                    //event = eventsResult[0]
                }
            }
        }
        return event
    }
    
    public func getSeries() -> [Series]? {
        let url: String = base + "series/" + key
        var series: [Series]? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let seriesResponse = response.result.value { 
                if let seriesResult = seriesResponse.data?.results {
                    //series = seriesResult
                }
            }
        }
        return series
    }
    
    public func getSeries(id: Int) -> Series? {
        let url: String = base + "series/\(id)" + key
        var series: Series? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let seriesResponse = response.result.value {
                if let seriesResult = seriesResponse.data?.results {
                    //series = seriesResult[0]
                }
            }
        }
        return series
    }
    
    public func getStories() -> [Story]? {
        let url: String = base + "stories/" + key
        var stories: [Story]? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let storyResponse = response.result.value {
                if let storyResult = storyResponse.data?.results {
                    //stories = storyResults
                }
            }
        }
        return stories 
    }
    
    public func getStory(id: Int) -> Story? {
        let url: String = base + "stories/\(id)" + key
        var story: Story? = nil
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let storyResponse = response.result.value {
                if let storyResult = storyResponse.data?.results {
                    //story = storyResults[0]
                }
            }
        }
        return story
    }
    
    private func md5(string: String) -> Data {
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }
}
