//
//  ShopDetailViewModel.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/12.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation
import Combine

final class ShopDetailViewModel: ObservableObject {

    @Published private(set) var shops = [Shop]()
    
    func loadShop() {
        let data = _loadShop()
        DispatchQueue.main.async {
            self.shops = data
        }
    }
    
    func addShop(shop: Shop) {
        var shops = _loadShop()
        shops.insert(shop, at: 0)
        saveShop(shopList: shops)
    }
    
    func removeShops(at offsets: IndexSet) {
        shops.remove(atOffsets: offsets)
        saveShop(shopList: shops)
    }

    private func saveShop(shopList: [Shop]) {
        let data = try! JSONEncoder().encode(shopList)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let documentsUrl = URL(fileURLWithPath: documentsPath)
        let favoriteUrl = documentsUrl.appendingPathComponent("favorite-shops.json")
        try! data.write(to: favoriteUrl)
    }
    
    private func _loadShop() -> [Shop] {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let documentsUrl = URL(fileURLWithPath: documentsPath)
        let favoritePrimesUrl = documentsUrl.appendingPathComponent("favorite-shops.json")
        guard
            let data = try? Data(contentsOf: favoritePrimesUrl),
            let favoriteShops = try? JSONDecoder().decode([Shop].self, from: data)
            else { return [] }
        return favoriteShops
    }
    
    
}

extension Shop: Equatable {
    static func == (lhs: Shop, rhs: Shop) -> Bool {
        return lhs.id == rhs.id
    }
}
