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
        var image_url: [String]?
        var name: String?
        var description: String?
        var positive_votes_count: Int?
    }
