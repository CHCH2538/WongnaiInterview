//
//  InfoRequest.swift
//  Wongnai iOS Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 25/12/2564 BE.
//

import Foundation
import UIKit

class ImageInfoRequest {
    
    static let shared = ImageInfoRequest()
    
    func fetchImageInfo(onCompletion: @escaping ([ImagesInfo]) -> ()) {
        
        let urlStrimg = "https://api.500px.com/v1/photos?feature=popular&page=1"
        let url = URL(string: urlStrimg)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("It's nil")
                return
            }
            
            guard let imageInfoList = try? JSONDecoder().decode(ImageInfoList.self, from: data) else {
                print ("JSON Decode error.")
                return
            }
            print(imageInfoList.photos)
            onCompletion(imageInfoList.photos)
        }
        task.resume()
    }
}
