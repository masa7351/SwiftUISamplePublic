//
//  AreaListRow.swift
//  SwiftUISample
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import SwiftUI

struct AreaListRow: View {
    var name: String
    var body: some View {
        Text(name)
    }
}

struct AreaListRow_Previews: PreviewProvider {
    static var previews: some View {
        AreaListRow(name: "大手町")
    }
}
