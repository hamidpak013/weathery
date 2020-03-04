//
//  NetworkProcessor.swift
//  weathery
//
//  Created by osama on 03/03/2020.
//  Copyright © 2020 hamid. All rights reserved.
//

import Foundation

class NetworkProcessor
{
    var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    let url: URL
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONDictionaryHandler = (([String: Any]?) -> Void)
    func downloadJSONFromURL(_ completion: @escaping JSONDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse{
                    switch httpResponse.statusCode {
                    case 200:
                        if let data = data {
                            do{
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data,  options: .mutableContainers)
                                completion(jsonDictionary as? [String: Any])
                            } catch let error as NSError {
                                print("Errors processing json data: \(error.localizedDescription)")
                            }
                        }
                    default:
                        print("https response code: \(httpResponse.statusCode)")
                    }
                }
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
