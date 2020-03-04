//
//  ForcastService.swift
//  weathery
//
//  Created by osama on 03/03/2020.
//  Copyright © 2020 hamid. All rights reserved.
//

import Foundation
class ForcastService
{
    let forcastAPIKey: String
    let forcastBaseURL: URL?
    
    init(APIKey: String){
        self.forcastAPIKey = APIKey
        forcastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    func  getForcast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void) {
        
        if let forcastURL = URL(string:"\(forcastBaseURL!)/\(latitude),\(longitude)"){
            let networkProcessor = NetworkProcessor(url: forcastURL)
            networkProcessor.downloadJSONFromURL { (jsonDictionary) in
                if let currentWeatherDictionary = jsonDictionary?["currently"] as?
                    [String: Any] {
                    let currentWeather = CurrentWeather(weatherDicitionary: currentWeatherDictionary)
                    completion(currentWeather)
                }
                else {
                    completion(nil)
                }
            }
        }
    }
    
}
