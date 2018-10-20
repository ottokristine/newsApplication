//
//  NewsStories.swift
//  NewsApplication
//
//  Created by Kristine Otto on 10/19/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation

class NewsStory {
    let title: String
    let url: URL
    let description: String
    let source: String
    let imageURL: URL
    let publishedOn: String
    let author: String
    
    init(title: String, url: URL,description: String, source: String, imageURL: URL, publishedOn: String, author: String) {
        self.title = title
        self.url = url
        self.description = description
        self.source = source
        self.imageURL = imageURL
        self.publishedOn = publishedOn
        self.author = author
    }
}

