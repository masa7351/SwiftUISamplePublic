//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by Masanao Imai on 2020/03/11.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

// https://medium.com/@azamsharp/asynchronously-loading-images-in-swiftui-3d0452230949
// https://dev.to/gualtierofr/remote-images-in-swiftui-49jp
import Foundation
import SwiftUI
import Combine

public class ImageLoader: ObservableObject {
    
    @Published var data: UIImage?
    
    func load(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else { return }
                    self.data = nil
            DispatchQueue.main.async {
                self.data = UIImage(data: data)
            }
            
        }.resume()
        
    }
    
    
}
