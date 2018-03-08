//
//  Data.swift
//  MarvelComic
//
//  Created by Alec Malcolm on 2018-03-06.
//  Copyright © 2018 Alec Malcolm. All rights reserved.
//
import Foundation

extension Data {
    
    var hexString: String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    var md5: Data {
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        self.withUnsafeBytes({
            _ = CC_MD5($0, CC_LONG(self.count), &digest)
        })
        return Data(bytes: digest)
    }
    
}

