//
//  MiddleAreaListView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct MiddleAreaListView: View {
    var areaCode: String
    @ObservedObject var viewModel = MiddleAreaViewModel()
    var body: some View {
        List(viewModel.areas, id: \.id) { area in
            NavigationLink(destination: SmallAreaListView(areaCode: area.code)) {
                AreaListRow(name: area.name)
            }
        }
        .navigationBarTitle(Text("中エリア"), displayMode: .inline)
        .onAppear(perform: fetch)
    }
    
    private func fetch() {
        viewModel.fetch(areaCode: areaCode)
    }
}

struct MiddleAreaListView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleAreaListView(areaCode: "Z011")
    }
}
