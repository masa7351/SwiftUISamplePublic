//
//  SmallAreaClient.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

class SmallAreaClient: GenericAPIClient {
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func fetch(middleCode: String, completion: @escaping (Result<SmallAreaResult, APIError>) -> Void) {
        let endpoint = SmallAreaEndpoint(code: middleCode)
        fetch(with: endpoint.request, completion: completion)
    }
}

struct SmallAreaEndpoint: Endpoint {
    let base = "http://webservice.recruit.co.jp/"
    let path = "hotpepper/small_area/v1/"
    var queryItems: [URLQueryItem]? = [ URLQueryItem(name: "key", value: recruitApiKey), URLQueryItem(name: "format", value: "json")]
    init(code: String) {
        queryItems?.insert(URLQueryItem(name: "middle_area", value: code), at: 0)
    }
}
