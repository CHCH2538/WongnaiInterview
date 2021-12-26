//
//  Info.swift
//  Wongnai iOS Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 25/12/2564 BE.
//

import Foundation

    struct ImageInfoList: Codable {
        var photos: [ImagesInfo]
    }

    struct ImagesInfo: Codable {
        var images_url: URL
        var name: String
        var description: String
        var positive_votes_count: Int
    }


"photos": [
        {
            "image_url": [
                "https://drscdn.500px.org/photo/1041970615/q%3D50_h%3D450/v2?sig=892ed04e7c49e35c2149b9e191d81f9b2c5ca7904d5bb030b9398b568f43bcb6"
            ],
            "name": "A cold sunrise with warm light",
            "description": "Check out my website if you are interested to learn my workflow: https://www.martinpodt.com/Workflow \n\nSee my website for the most popular forest photography workshops in the Netherlands.",
            "positive_votes_count": 908,
            
                },
                
            },
            
            
        },
