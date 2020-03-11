//
//  GourmetClient.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

class GourmetClient: GenericAPIClient {
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func fetch(for type: SearchType, completion: @escaping (Result<ShopResult, APIError>) -> Void) {
        let endpoint = GourmetEndpoint(type: type)
        fetch(with: endpoint.request, completion: completion)
    }

}

struct GourmetEndpoint: Endpoint {
    let base = "http://webservice.recruit.co.jp/"
    let path = "hotpepper/gourmet/v1/"
    var queryItems: [URLQueryItem]? = [ URLQueryItem(name: "key", value: recruitApiKey), URLQueryItem(name: "format", value: "json")]

    let search: String

    init(type: SearchType) {
        self.search = type.text
        queryItems?.insert(type.queryItem, at: 0)
    }

}

enum SearchType {
    case name(String)
    case tel(String) // ハイフンなし
    case keyword(String) // 店名かな、店名、住所、駅名、お店ジャンルキャッチ、キャッチのフリーワード検索(部分一致)が可能です。文字コードはUTF8。半角スペース区切りの文字列を渡すことでAND検索になる。複数指定可能
    case middleArea(String)
    case smallArea(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .name(let name):
            return URLQueryItem(name: "name", value: name)
        case .tel(let tel):
            let rawTel = tel.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
            return URLQueryItem(name: "tel", value: rawTel)
        case .keyword(let keywords):
            let k = keywords.replacingOccurrences(of: ",", with: " ", options: .literal, range: nil)
            return URLQueryItem(name: "keyword", value: k)
        case .middleArea(let code):
            return URLQueryItem(name: "middle_area", value: code)
        case .smallArea(let code):
            return URLQueryItem(name: "small_area", value: code)
        }
    }
    
    var text: String {
        switch self {
        case .name(let name):
            return name
        case .tel(let tel):
            return tel
        case .keyword(let keywords):
            return keywords
        case .middleArea(let code):
            return code
        case .smallArea(let code):
            return code
        }
    }
}
