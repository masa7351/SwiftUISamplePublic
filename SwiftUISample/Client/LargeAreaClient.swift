//
//  LargeAreaClient.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

class LargeAreaClient: GenericAPIClient {
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func fetch(completion: @escaping (Result<LargeAreaResult, APIError>) -> Void) {
        let endpoint = LargeAreaEndpoint()
        fetch(with: endpoint.request, completion: completion)
    }
}

struct LargeAreaEndpoint: Endpoint {
    let base = "http://webservice.recruit.co.jp/"
    let path = "hotpepper/large_area/v1/"
    var queryItems: [URLQueryItem]? = [ URLQueryItem(name: "key", value: recruitApiKey), URLQueryItem(name: "format", value: "json")]
}
