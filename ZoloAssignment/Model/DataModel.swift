//
//  DataModel.swift
//  ZoloAssignment
//
//  Created by Mayank on 10/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import Foundation
import  UIKit
class DataModel: NSObject {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
    var body: String?
    
    init(infoData: [String: Any]) {
        if let  userId = infoData["userId"] as? Int {
            self.userId = userId
        }
        if let  id = infoData["id"] as? Int {
            self.id = id
        }
        if let title = infoData["title"] as? String {
            self.title = title
        }
        if let completed = infoData["completed"] as? Bool {
            self.completed = completed
        }
        if let body = infoData["body"] as? String {
            self.body = body
        }
    }
    
}
