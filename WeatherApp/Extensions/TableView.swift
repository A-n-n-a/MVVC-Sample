//
//  TableView.swift
//  WeatherApp
//
//  Created by Anna on 7/30/20.
//  Copyright © 2020 Anna. All rights reserved.
//

import UIKit

extension UITableView {
    func register(cellClass: AnyClass) {
        let bundle = Bundle(for: cellClass)
        let nib = UINib(nibName: String(describing: cellClass), bundle: bundle)
        self.register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
}
