//
//  AreaListView.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct AreaListView: View {
    @ObservedObject var viewModel = LargeAreaViewModel()
    
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.areas, id: \.id) { area in
                NavigationLink(destination: MiddleAreaListView(areaCode: area.code)) {
                    AreaListRow(name: area.name)
                }
            }
            .navigationBarTitle(Text("大エリア"), displayMode: .inline)
        }
    }
}

struct AreaListView_Previews: PreviewProvider {
    static var previews: some View {
        AreaListView()
    }
}
