//
//  RedditPicsModel.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

struct Listing: Decodable{
    let data: ListData
}

struct ListData: Decodable{
    let children: [Children]
}

struct Children: Decodable{
    let data: ChildrenData
}

struct ChildrenData: Decodable {
    let title: String
    let name: String
    let ups: Int64?
    let thumbnail: String?
    let num_comments: Int64?
    let url: String?
}


