//
//  CitiesListViewModel.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import UIKit

class CitiesListViewModel {
    
    var cities = [City(name: "Kyiv"),
                  City(name: "London"),
                  City(name: "Miami"),
                  City(name: "Dubai"),
                  City(name: "Paris"),
                  City(name: "Bangkok"),
                  City(name: "Singapore")]
    
    func getWeather(completion: @escaping ((_ success: Bool, _ error: Error?) -> Void)) {
        var err: Error?
        let updateGroup = DispatchGroup()
                
        DispatchQueue.concurrentPerform(iterations: cities.count) { counterIndex in
            let index = Int(counterIndex)
            let city = cities[index].name
            
            updateGroup.enter()
            
            NetworkManager.getWeather(for: city) { [weak self] (weather, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        err = error
                    }
                    
                    if let weather = weather {
                        self?.cities[index].weather = weather
                    }
                    
                    updateGroup.leave()
                }
            }
        }
        updateGroup.notify(queue: DispatchQueue.main) {
            if let error = err {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    func showDetais(for city: City) {
        if let detailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "detailsVC") as? DetailsViewController {
            detailsVC.city = city
            UIApplication.topViewController()?.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
