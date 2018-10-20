//
//  LaunchScreenViewController.swift
//  NewsApplication
//
//  Created by Kristine Otto on 10/19/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation
import UIKit

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        if let url = URL(string: APIRequests.sharedInstance.defaultNewsStories) {
            APIRequestManager.sharedInstance.MakeAPICall(url: url, completion: {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "navViewController")
                self.present(vc, animated: true, completion: {})
            })
        }
    }
}
