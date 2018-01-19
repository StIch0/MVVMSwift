//
//  DetailsViewModel.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 18/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
class DetailsViewModel {
    var cityTitle: String!
    var windString: String!
    var precipitationString: String!
    var temperatureString: String!
   // var weather: Weather!
    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format: "%0.f%@", weather.temprature, "\u{00B0}")
        var windStr: String = ""
        switch weather.windDirection! {
        case .East:
            windStr = "East";break;
        case .North:
             windStr = "North";break;
        case .West:
            windStr = "West";break;
        case .South:
            windStr = "South";break;
        }
        self.windString = String (format: "%@ wind, %0.f m/s",windStr, weather.windSpeed)
        var precipitationStr: String = ""
        switch weather.precipitation! {
        case .Cloudly:
            precipitationStr = "Cloudly";break;
        case .Sunny:
            precipitationStr = "Sunny";break;
        case .Stormly:
            precipitationStr = "Stormly";break;
        case .Thunderly:
            precipitationStr = "Thunderly";break;
        case .Rainy:
            precipitationStr = "Rainy";break;
        }
        self.precipitationString = precipitationStr
        print("Details",cityTitle,windString,precipitationString,temperatureString)
     }
}
