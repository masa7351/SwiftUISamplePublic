//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Change Safe Area Color
            // https://www.hackingwithswift.com/books/ios-swiftui/colors-and-frames
            naviColor.edgesIgnoringSafeArea(.all)
            TabView {
                SearchGourmetView().tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass.circle")
                        Text("検索")
                    }
                }.tag(1)
                
                AreaListView().tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("エリア一覧")
                    }
                }.tag(2)
                
                FavoriteShopListView().tabItem {
                    VStack {
                        Image(systemName: "book")
                        Text("お気に入り一覧")
                    }
                }.tag(3)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
