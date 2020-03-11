//
//  ShopListView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct ShopListView: View {
    var code: String
    @ObservedObject var viewModel = GourmetViewModel()
    var body: some View {
        List(viewModel.shops) { shop in
            NavigationLink(destination: ShopDetailView(shop: shop)) {
                ShopListRow(shop: shop)
            }
        }
        .navigationBarTitle(Text("お店一覧"), displayMode: .inline)
        .onAppear(perform: fetch)
    }
    func fetch() {
        viewModel.fetchSmallArea(code)
    }
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView(code: "X115")
    }
}
