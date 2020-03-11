//
//  AreaResult.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

@dynamicMemberLookup
struct LargeAreaResult: Codable {
    var results: Results
    struct Results: Codable {
        var list: [Area]
        enum CodingKeys: String, CodingKey {
            case list = "large_area"
        }
    }
    subscript<T>(dynamicMember keyPath: KeyPath<Results, T>) -> T {
        return results[keyPath: keyPath]
    }
}

@dynamicMemberLookup
struct MiddleAreaResult: Codable {
    var results: Results
    struct Results: Codable {
        var list: [Area]
        enum CodingKeys: String, CodingKey {
            case list = "middle_area"
        }
    }
    subscript<T>(dynamicMember keyPath: KeyPath<Results, T>) -> T {
        return results[keyPath: keyPath]
    }
}

@dynamicMemberLookup
struct SmallAreaResult: Codable {
    var results: Results
    struct Results: Codable {
        var list: [Area]
        enum CodingKeys: String, CodingKey {
            case list = "small_area"
        }
    }
    subscript<T>(dynamicMember keyPath: KeyPath<Results, T>) -> T {
        return results[keyPath: keyPath]
    }
}

struct Area: Identifiable, Codable {
    var code: String
    var name: String
    var id: String {
        return code
    }
}
