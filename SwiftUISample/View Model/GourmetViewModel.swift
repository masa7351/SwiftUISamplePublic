//
//  GourmetViewModel.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class GourmetViewModel: ObservableObject {
    
    @Published private(set) var shops = [Shop]()
    @Published var searchWord = ""
    private var client = GourmetClient()
    
    func fetchName() {
        fetch(SearchType.keyword(searchWord))
    }

    func fetchTel() {
        fetch(SearchType.tel(searchWord))
    }

    func fetchKeyword() {
        fetch(SearchType.keyword(searchWord))
    }
    
    func fetchSmallArea(_ code: String) {
        fetch(SearchType.smallArea(code))
    }
    
    private func fetch(_ type: SearchType) {
        client.fetch(for: type) { [weak self] result in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                switch result {
                case .success(let result):
                    weakSelf.shops = result.results.list
                case .failure(let error):
                    weakSelf.shops = []
                    print(error)
                }
            }
        }
    }
}
