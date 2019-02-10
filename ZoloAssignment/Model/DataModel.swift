//
//  HeaderDataModel.swift
//  ZoloAssignment
//
//  Created by Mayank on 10/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import Foundation
import  UIKit

class HeaderDataModel: NSObject {
    
    var userId: Int
    var title: String
    var completed: Bool
    
    init(json: [String: Any]) {
        self.userId = json["userId"] as! Int
        self.title = json["title"] as! String
        self.completed = json["completed"] as! Bool
    }
    
    static func getData(completion: @escaping ([HeaderDataModel]) -> ()) {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                var headerData: [HeaderDataModel] = []
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                            for jsonData in json {
                                let headerModelObject = HeaderDataModel(json: jsonData)
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
