//
//  AppDelegate.swift
//  weathery
//
//  Created by osama on 03/03/2020.
//  Copyright © 2020 hamid. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let url = URL(string: "https://api.darksky.net/forecast/af8f1ca416aa038bf3084ce323cf93b3/31.5204,74.3587")
        if let url = url{
            let networkProcessor = NetworkProcessor(url: url)
            networkProcessor.downloadJSONFromURL { (jsonDictionary) in
                print(jsonDictionary)
        }
//        let forcastService = ForcastService(APIKey: "5ca6807ad263cc1f48ef5780fffc6edc")
//        forcastService.getForcast(latitude: 37.8267, longitude: -122.4233) { (currentWeather) in
//            print(currentWeather!.humidity!)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

