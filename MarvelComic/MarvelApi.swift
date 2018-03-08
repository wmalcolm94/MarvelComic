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
    //let url: String = "http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150"
    let base: String    //https://gateway.marvel.com:443/v1/public/comics?apikey=3f0f2b65c4f991264ccaa01f416fa462
    let publicKey: String = "3f0f2b65c4f991264ccaa01f416fa462"
    let privateKey: String = "9bedea7ebde0ab7c75d5f6525a8550b1bcadc8c1"
    let key: String 
    let date: Int
    
    var comics: [Comic]
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
        comics = []
    }
    
    public func getComic(id: Int) -> Comic? {
        let url: String = base + "comics/\(id)" + key
        Alamofire.request(url).responseObject { (response: DataResponse<MarvelWrapper>) in
            if let comicResponse = response.result.value {
                if let comicResults = comicResponse.data?.results {
                    self.comics += comicResults
                    self.printComics()
                }
            } else {
                print("Error parsing")
            }
        }
        return nil
    }
    
    public func printComics() {
        for comic in comics {
            print()
        }
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
