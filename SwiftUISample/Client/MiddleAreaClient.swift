//
//  MiddleAreaClient.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

class MiddleAreaClient: GenericAPIClient {
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func fetch(largeCode: String, completion: @escaping (Result<MiddleAreaResult, APIError>) -> Void) {
        let endpoint = MiddleAreaEndpoint(code: largeCode)
        fetch(with: endpoint.request, completion: completion)
    }
}

struct MiddleAreaEndpoint: Endpoint {
    let base = "http://webservice.recruit.co.jp/"
    let path = "hotpepper/middle_area/v1/"
    var queryItems: [URLQueryItem]? = [ URLQueryItem(name: "key", value: recruitApiKey), URLQueryItem(name: "format", value: "json")]
    init(code: String) {
        queryItems?.insert(URLQueryItem(name: "large_area", value: code), at: 0)
    }
}
