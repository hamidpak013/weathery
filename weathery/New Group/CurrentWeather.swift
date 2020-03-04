//
//  CurrentWeather.swift
//  weathery
//
//  Created by osama on 03/03/2020.
//  Copyright © 2020 hamid. All rights reserved.
//

import Foundation
class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
       
    }
    init(weatherDicitionary: [String: Any])
    {
        
        temperature = weatherDicitionary[WeatherKeys.temperature] as? Int
      
        if let humidityDouble = weatherDicitionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        }
        else {
            humidity = nil
        }
        print("humidity = \(humidity)")
          print(temperature)
        if let precipDouble = weatherDicitionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        }
        else {
            precipProbability = nil
        }
        
//        if let sum = weatherDicitionary[WeatherKeys.summary] as? String {
//            summary = sum
//        }
        summary = weatherDicitionary[WeatherKeys.summary] as? String
    }
}
