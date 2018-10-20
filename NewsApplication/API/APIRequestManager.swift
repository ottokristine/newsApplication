//
//  APIRequestManager.swift
//  NewsApplication
//
//  Created by Kristine Otto on 10/19/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation

class APIRequestManager {
    static let sharedInstance = APIRequestManager()
    
    let session = URLSession.shared
    
    func getStarterStories() {
        if let url = URL(string: APIRequests.sharedInstance.defaultNewsStories) {
            MakeAPICall(url: url, completion: {print("closuresuccessful")})
        }
    }
    
    func MakeAPICall(url: URL, completion: @escaping () -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                self.parseArticles(data: data!,completion: completion)
            }
            else {
                print ("there was an error making api call: \(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
    }
    
    func parseArticles(data: Data, completion: @escaping () -> Void) {
        var parseArticleArray = [NewsStory]()
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
        let articles = json["articles"] as! [Any]
        for article in articles {
            let dict = article as! [String:Any]
            let title = dict["title"] as! String
            let url = dict["url"] as! String
            let source = dict["source"] as! [String: Any]
            let sourceName = source["name"] as! String
            var author: String = ""
            if let authorName = dict["author"] as? String {
                author = authorName
            }
            let publishedDate = dict["publishedAt"] as! String
            let imageURLString = (dict["urlToImage"] as? String ?? "")
            let description = (dict["description"] as? String ?? "")
            
            if let imageURL = URL(string: imageURLString) {
                if let url = URL(string: url) {
                    let story = NewsStory(title: title, url: url, description: description, source: sourceName, imageURL: imageURL, publishedOn: publishedDate, author: author)
                    parseArticleArray.append(story)
                }
            }
        }
        print(parseArticleArray)
        articleArray = parseArticleArray
        completion()
    }
}
