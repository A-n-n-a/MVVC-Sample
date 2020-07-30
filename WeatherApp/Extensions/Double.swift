//
//  Double.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import Foundation

extension Double {
    //Convert Kelvin into Celsius
    func toCelcius() -> String {
        let celcius = Int(self - 273.15)
        var sign = ""
        if celcius > 0 {
            sign = "+"
        }
        if celcius < 0 {
            sign = "-"
        }
        return "\(sign)\(celcius)\u{00B0}C"
    }
}
