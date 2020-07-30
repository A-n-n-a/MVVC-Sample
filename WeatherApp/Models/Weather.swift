//
//  Weather.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import UIKit
import CoreLocation

class Weather: Decodable {
    
    var temp: Double? = nil
    var image: UIImage?
    var backgroundImage: UIImage? 
    var description: String = ""
    var location: CLLocationCoordinate2D? = nil
    
    enum CodingKeys: String, CodingKey {
        case main
        case details = "weather"
        case coord
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let main = try container.decode(Main.self, forKey: .main)
        temp = main.temp
        let detailsArray = try container.decode([Details].self, forKey: .details)
        if let details = detailsArray.first {
            image = details.image
            backgroundImage = UIImage(named: details.name)
            description = details.description
        }
        
        let coord = try container.decode(Coord.self, forKey: .coord)
        location = CLLocationCoordinate2D(latitude: coord.lat, longitude: coord.lon)
    }
}

class Details: Decodable {
    var image: UIImage?
    var name: String = ""
    var description: String = ""
    
    enum CodingKeys: String, CodingKey {
        case icon
        case name = "main"
        case description
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let iconName = try container.decode(String.self, forKey: .icon)
        image = UIImage(named: iconName)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
    }
}

struct Main: Decodable {
    let temp: Double
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}
