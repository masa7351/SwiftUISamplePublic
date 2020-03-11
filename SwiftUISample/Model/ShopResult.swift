//
//  ShopResult.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

struct ShopResult: Codable {
    var results: Results
    struct Results: Codable {
        var list: [Shop]
        enum CodingKeys: String, CodingKey {
            case list = "shop"
        }
    }
}

@dynamicMemberLookup
struct Shop: Identifiable, Codable {
    var id: String
    var name: String
    var address: String
    var access: String
    var lat: Double
    var lng: Double
    var catchCopy: String
    var photo: Photo
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case access = "access"
        case lat = "lat"
        case lng = "lng"
        case catchCopy = "catch"
        case photo = "photo"
    }
    subscript<T>(dynamicMember keyPath: KeyPath<Photo, T>) -> T {
        return photo[keyPath: keyPath]
    }
}

struct Photo: Codable {
    var mobile: Mobile
    var pc: Pc
    struct Mobile: Codable {
        var largePhoto: String
        var smallPhoto: String
        
        enum CodingKeys: String, CodingKey {
            case largePhoto = "l"
            case smallPhoto = "s"
        }
    }
    
    struct Pc: Codable {
        var largePhoto: String
        
        enum CodingKeys: String, CodingKey {
            case largePhoto = "l"
        }
    }
}
