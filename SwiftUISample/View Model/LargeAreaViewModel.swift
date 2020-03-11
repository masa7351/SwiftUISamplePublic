//
//  AreaViewModel.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class LargeAreaViewModel: ObservableObject {
    
    @Published private(set) var areas = [Area]()
    private var client = LargeAreaClient()
    
    init() {
        client.fetch { [weak self] result in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                switch result {
                case .success(let result):
                    weakSelf.areas = result.list
                case .failure(let error):
                    weakSelf.areas = []
                    print(error)
                }
            }
        }
    }

}
