//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private static let url = "http://api.openweathermap.org/data/2.5/weather?q=%@&APPID=c50391d958cdbde9e137158a91a1c8e3"
    
    typealias Completion = ((_ weather: Weather?, _ error: Error?) -> Void)?
    
    static func getWeather(for city: String, completion: Completion) {
        let cityUrl = String(format: url, city)
        print(cityUrl)
        guard let url = URL(string: cityUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    print("RESPONSE:\n\(try JSONSerialization.jsonObject(with: data, options: .allowFragments))")
                    let object = try JSONDecoder().decode(Weather.self, from: data)
                    completion?(object, nil)
                } catch {
                    completion?(nil, error)
                }
            }
        }
        task.resume()
    }
}
