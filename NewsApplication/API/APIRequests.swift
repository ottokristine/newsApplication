//
//  APIRequests.swift
//  NewsApplication
//
//  Created by Kristine Otto on 10/19/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation

class APIRequests {
    static let sharedInstance = APIRequests()
    
    let key = "apiKey=7b18b8681b844224b6284e1f4b32bf64"
    let baseURL = "https://newsapi.org/v2/"
    
    let privacyFilter = "q=privacy"
    
    let categoryFilter = "q=Saudi"
    
    let everything = "everything?"
    let topHeadlines = "top-headlines?"
    
    var defaultNewsStories: String {
        return (baseURL + everything + privacyFilter + "&" + key)
    }
    
    var topHeadLinesStories: String {
        //return (baseURL + topHeadlines +  "country=us&" + key)
        return "https://newsapi.org/v2/top-headlines?country=us&apiKey=7b18b8681b844224b6284e1f4b32bf64"
    }
    
    var businessStories: String {
        return (baseURL + topHeadlines + categoryFilter + key)
    }
}
