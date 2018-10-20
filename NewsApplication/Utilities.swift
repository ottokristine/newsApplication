//
//  Utilities.swift
//  NewsApplication
//
//  Created by Kristine Otto on 10/19/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation

extension String {
    func removeTime() -> String{
        if let index = self.range(of: "T")?.lowerBound {
            return self.substring(to: index)
        }
        return self
    }
}
