//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var city: City! {
        didSet {
            setupCell()
        }
    }
    
    private func setupCell() {
        cityNameLabel.text = city.name
        descriptionLabel.text = city.weather?.description.capitalized
        temperatureLabel.text = city.weather?.temp?.toCelcius()
        weatherIcon.image = city.weather?.image
    }
}
