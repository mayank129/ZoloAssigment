//
//  DataModel.swift
//  ZoloAssignment
//
//  Created by Mayank on 10/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import Foundation

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
    
    static func getData(withUrl url: String, completion: @escaping ([DataModel]) -> ()) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                var headerData: [DataModel] = []
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                            for jsonData in json {
                                let headerModelObject = DataModel(infoData: jsonData)
                                headerData.append(headerModelObject)
                            }
                        }
                        completion(headerData)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
}
