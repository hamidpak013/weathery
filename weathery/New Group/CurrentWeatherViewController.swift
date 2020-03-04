//
//  CurrentWeatherViewController.swift
//  weathery
//
//  Created by osama on 04/03/2020.
//  Copyright © 2020 hamid. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    
    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let forcastAPIKey = "af8f1ca416aa038bf3084ce323cf93b3"
    let coordinates: (lat: Double, long: Double) = (31.5204, 74.3587)
   
    override func viewDidLoad() {
        super.viewDidLoad()

      let forcastService = ForcastService(APIKey: forcastAPIKey)
        forcastService.getForcast(latitude: coordinates.lat, longitude: coordinates.long) { (currentWeather) in
            //this is off the main queu
            print(currentWeather!.temperature)
            if let currentWeather = currentWeather
            {
                // Rule: ALl UI Code must happen on the main queue
                // TODO: get back to main queue
                DispatchQueue.main.async {
                    if let summary = currentWeather.summary {
                        self.temperatureLabel.text = "\(summary)"
                    }
                   
//                    self.temperatureScaleLabel.text = "\(currentWeather.temperature!)"
                    if let temperature = currentWeather.temperature{
                        self.temperatureScaleLabel.text = "\(temperature)"
                    }
                    
                    self.cityTextLabel.text = "\(currentWeather.humidity!)"
                }
                
            }
        }
    }
    

}
