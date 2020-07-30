//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let city = city, let location = city.weather?.location else { return }
        cityLabel.text = city.name
        temperatureLabel.text = city.weather?.temp?.toCelcius()
        weatherImage.image = city.weather?.backgroundImage
        mapView.setCenter(location, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
