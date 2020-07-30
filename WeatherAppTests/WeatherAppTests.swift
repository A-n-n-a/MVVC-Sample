//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGeneratingModel() throws {
        
        let weather = getWeatherModel()
        XCTAssertNotNil(weather, "Weather model shoul not be nil")
        
    }
    
    func testGeneratingImages() throws {
        let weather = getWeatherModel()
        XCTAssertTrue(weather?.backgroundImage == #imageLiteral(resourceName: "Clouds"), "Background image was generated wrong")
        XCTAssertTrue(weather?.image == #imageLiteral(resourceName: "02d"), "Small image was generated wrong")
    }
    
    func testTemperature() throws {
        let weather = getWeatherModel()
        XCTAssertTrue(weather?.temp == 280.32, "Temperature in Kelvin calculated wrong")
        XCTAssertTrue(weather?.temp?.toCelcius() == "+7\u{00B0}C", "Temperature in Celcius calculated wrong [\(String(describing: weather?.temp?.toCelcius()))]")
    }
    
    func testDescription() throws {
        let weather = getWeatherModel()
        XCTAssertTrue(weather?.description == "few clouds", "Wrong description")
    }

    private func getWeatherModel() -> Weather? {
        guard let jsonData = MocResponder.getWeatherMock() else { return nil }
        let weather = try? JSONDecoder().decode(Weather.self, from: jsonData)
        return weather
    }
}

