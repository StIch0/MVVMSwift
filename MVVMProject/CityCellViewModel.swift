//
//  CityCellViewModel.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 18/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
class CityCellViewModel {
    var cityTitle: String!
    var temperatureString: String!
    var timeString: String!
    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format: "%0.f%@", weather.temprature, "\u{00B0}")
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weather.timeStamp)
        df.dateFormat = "HH:mm"
        self.timeString = df.string(from: date)
    }
}
