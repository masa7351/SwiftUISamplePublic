//
//  ShopDetailView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/12.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI
import ImageLoader

struct ShopDetailView: View {
    var shop: Shop
    @ObservedObject var viewModel = ShopDetailViewModel()
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 5) {
                URLImage(url: shop.pc.largePhoto)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .clipped()
                Text(shop.name).font(.system(size: 18))
                Text(shop.catchCopy).font(.system(size: 13))
                Text(shop.address).font(.system(size: 13))
                Text(shop.access).font(.system(size: 13))
                Text("Dummy Text")
                    .frame(height: UIScreen.main.bounds.height)
                Spacer()
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.viewModel.addShop(shop: self.shop)
            }) {
                Text("Add")
            }.disabled(viewModel.shops.contains(shop))
        ).onAppear(perform: fetch)
    }

    func fetch() {
        viewModel.loadShop()
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    
    static var mobile = Photo.Mobile(largePhoto:"https://imgfp.hotp.jp/IMGH/05/91/P034400591/P034400591_168.jpg", smallPhoto:"https://imgfp.hotp.jp/IMGH/05/91/P034400591/P034400591_100.jpg")

    static var pc = Photo.Pc(largePhoto:"https://imgfp.hotp.jp/IMGH/05/91/P034400591/P034400591_238.jpg")

    
    static var shop = Shop(id : "1", name : "Salt Water ソルトウォーター by David Myers ガーデンプレイス", address : "東京都渋谷区恵比寿４-20-4 恵比寿ガーデンプレイス　GLASS SQUARE B1F", access : "恵比寿駅ガーデンプレイス口徒歩3分！GLASS　SQUARE　B1Fにございます。屋根があるので雨の日も濡れずに安心！", lat : 35.6422404517, lng : 139.7130248161, catchCopy : "女子会限定デザートアート 記念日/デート/合コンに♪", photo : Photo(mobile: mobile, pc: pc)
    )
    
    static var previews: some View {
        NavigationView {
            ShopDetailView(shop: shop)
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
}
