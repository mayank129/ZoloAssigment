//
//  ServerRequest.swift
//  ZoloAssignment
//
//  Created by Mayank on 11/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import Foundation
import UIKit

class ServerRequest {
    
    static let shareInstance = ServerRequest()
    
    private init() {}
    
    func getData(withUrl url: String, completion: @escaping ([DataModel]) -> ()) {
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
    
    func getImage(fromUrl urlStringurl: String, completion: @escaping (UIImage) -> ()) {
        if let image = imageCache.getImge(forKey: urlStringurl) {
            completion(image)
        }
        else {
            if let url = URL(string: urlStringurl) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if error != nil {
                        return
                    }
                    if let data = data, let image = UIImage(data: data) {
                        imageCache.addImage(image, key: urlStringurl)
                        completion(image)
                    }
                    }.resume()
            }
        }
    }
}
