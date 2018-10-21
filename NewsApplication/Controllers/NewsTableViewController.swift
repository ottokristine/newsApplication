//
//  NewsTableViewController.swift
//  NewsApplication
//
//  Created by Kristine Otto on 10/19/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

var articleArray = [NewsStory]()

class NewsTableViewController: UITableViewController {
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    @IBOutlet weak var highestRatedButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        spinner.center = self.tableView.center
        spinner.color = UIColor.black
        self.view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        print("view did load")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "newsStoryTableViewCell") as! NewsStoryTableViewCell
        let article = articleArray[indexPath.row]
        
        cell.titleLabel.text = article.title
        if let data = try? Data(contentsOf: article.imageURL) {
            cell.articleImageView.image = UIImage(data: data)
        }
        cell.descriptionLabel.text = article.description
        let additionalData = (article.source + ", " + article.author + " on " + article.publishedOn.removeTime())
        cell.authorLabel.text = additionalData
        //cell.
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articleArray[indexPath.row]
        let svc = SFSafariViewController(url: article.url)
        self.present(svc, animated: true, completion: nil)
    }
    
    @IBAction func highestRatedButton_Tap(_ sender: Any) {
        spinner.startAnimating()
        if let url = URL(string: APIRequests.sharedInstance.topHeadLinesStories) {
            APIRequestManager.sharedInstance.MakeAPICall(url: url, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinner.stopAnimating()
                }
            })
        }
    }
    @IBAction func privacyNews_tap(_ sender: Any) {
        spinner.startAnimating()
        if let url = URL(string: APIRequests.sharedInstance.defaultNewsStories) {
            APIRequestManager.sharedInstance.MakeAPICall(url: url, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinner.stopAnimating()
                }
            })
        }
    }
    @IBAction func technologyButton_Tap(_ sender: Any) {
        spinner.startAnimating()
        if let url = URL(string: APIRequests.sharedInstance.technologyNews) {
            APIRequestManager.sharedInstance.MakeAPICall(url: url, completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinner.stopAnimating()
                }
            })
    }
}
}
