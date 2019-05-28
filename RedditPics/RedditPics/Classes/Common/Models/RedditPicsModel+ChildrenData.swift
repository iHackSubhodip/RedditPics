//
//  RedditPicsModel+ChildrenData.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 28/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

struct ChildrenData: Decodable {
    let title: String
    let name: String
    let ups: Int64?
    let thumbnail: String?
    let num_comments: Int64?
    let url: String?
}
