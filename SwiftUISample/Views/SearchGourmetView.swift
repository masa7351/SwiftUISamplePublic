//
//  SearchGourmetView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct SearchGourmetView: View {
    @ObservedObject var viewModel = GourmetViewModel()
    
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchShopBarView(text: $viewModel.searchWord) {
                    self.viewModel.fetchName()
                }
                List(viewModel.shops) { shop in
                    NavigationLink(destination: ShopDetailView(shop: shop)) {
                        ShopListRow(shop: shop)
                    }
                }
            }
            .navigationBarTitle(Text("お店検索"), displayMode: .inline)
        }
    }
}

private struct SearchShopBarView: View {
    @Binding var text: String
    @State var action: () -> Void
    var body: some View {
        ZStack {
            naviColor
            HStack {
                TextField("お店の名前を入力", text: $text)
                    .padding([.leading, .trailing], 10)
                    .frame(height: 32)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                Button(action: action, label: { Text("検索") })
                    .foregroundColor(Color.white)
            }
            .padding([.leading, .trailing], 16)
        }
        .frame(height: 64)
    }
}


struct SearchGourmetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGourmetView()
    }
}
