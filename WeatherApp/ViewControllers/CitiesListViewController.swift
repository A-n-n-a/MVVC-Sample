//
//  ViewController.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = CitiesListViewModel()
    let cellId = String(describing: CityTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(cellClass: CityTableViewCell.self)
        fillTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func fillTableView() {
        activityIndicator.startAnimating()
        viewModel.getWeather { [weak self] (success, error) in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                if success {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension CitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! CityTableViewCell
        cell.city = viewModel.cities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = viewModel.cities[indexPath.row]
        viewModel.showDetais(for: city)
    }
}
