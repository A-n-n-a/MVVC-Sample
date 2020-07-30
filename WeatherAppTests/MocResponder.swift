//
//  MocResponder.swift
//  WeatherAppTests
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import Foundation
@testable import WeatherApp

class MocResponder {
    
    
    static func getWeatherMock() -> Data? {
        let bundle = Bundle(for: WeatherAppTests.self)
        guard let jsonPath = bundle.url(forResource: "Weather", withExtension: "json") else {
            fatalError(" ---> User model JSON path is incorrect. [JSON Name: Weather]")
        }
        do {
            let jsonData = try Data(contentsOf: jsonPath)
            
            return jsonData
        } catch {
            fatalError(" ---> Error Deserializing json object with data. Error: \(error)")
        }
    }
}
