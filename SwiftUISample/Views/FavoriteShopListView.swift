//
//  FavoriteShopListView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/12.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct FavoriteShopListView: View {
    @ObservedObject var viewModel = ShopDetailViewModel()
    
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.shops, id:\.id) { shop in
                    NavigationLink(destination: ShopDetailView(shop: shop)) {
                        ShopListRow(shop: shop)
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationBarTitle(Text("お気に入り一覧"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
        .onAppear(perform: fetch)
    }
    
    func fetch() {
        viewModel.loadShop()
    }
    
    func removeRows(at offsets: IndexSet) {
        viewModel.removeShops(at: offsets)
    }
}

struct FavoriteShopListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShopListView()
    }
}
