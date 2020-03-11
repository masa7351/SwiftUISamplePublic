//
//  SmallAreaListView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct SmallAreaListView: View {
    var areaCode: String
    @ObservedObject var viewModel = SmallAreaViewModel()
    var body: some View {
        List(viewModel.areas, id: \.id) { area in
            NavigationLink(destination: ShopListView(code: area.code)){
                AreaListRow(name: area.name)
            }
        }
        .navigationBarTitle(Text("小エリア"), displayMode: .inline)
        .onAppear(perform: fetch)
    }
    
    private func fetch() {
        viewModel.fetch(areaCode: areaCode)
    }
}

struct SmallAreaListView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAreaListView(areaCode: "Y115")
    }
}
