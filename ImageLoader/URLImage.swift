//
//  URLImage.swift
//  ImageLoader
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import Foundation
import SwiftUI

public struct URLImage: View {
    
    @ObservedObject public private(set) var imageLoader = ImageLoader()
    
    var placeholder: Image
    
    public init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
    }
    
    public var body: some View {
        if let uiImage = self.imageLoader.data {
            return Image(uiImage: uiImage).resizable()
        } else {
            return placeholder.resizable()
        }
    }
    
}
