//
//  Endpoint.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {

    private var urlComponents: URLComponents? {
        guard var components = URLComponents(string: "\(base)\(path)") else { return nil }
        components.queryItems = queryItems
        return components
    }

    var request: URLRequest {
        let url = urlComponents?.url ?? URL(string: "\(base)\(path)")!
        print("request url:\(urlComponents?.url?.absoluteString ?? "empty")")
        let request = URLRequest(url: url)
        return request
    }

}
