//
//  WeatherManager.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 18/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
class WeatherManager {
    //Request
    func getWeather(comletion: @escaping ([Weather])->Void){
        let delay : Double =  2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            comletion(self.mockResponse())
        }
     }
    private func mockResponse()->[Weather] {
        var array = [Weather]()
        array.append(mockWeatherObject(temprature: 10.0, city: "London", precipitation: .Rainy, windSpeed: 1.0, windDirection: .North))
        array.append(mockWeatherObject(temprature: 11.0, city: "Moscow", precipitation: .Cloudly, windSpeed: 2.0, windDirection: .North))
        array.append(mockWeatherObject(temprature: 12.0, city: "Qwerty", precipitation: .Sunny, windSpeed: 3.0, windDirection: .South))
        array.append(mockWeatherObject(temprature: 12.0, city: "yyry", precipitation: .Rainy, windSpeed: 4.0, windDirection: .North))
        array.append(mockWeatherObject(temprature: 13.0, city: "Lodasdasdndon", precipitation: .Stormly, windSpeed: 5.0, windDirection: .West))
        array.append(mockWeatherObject(temprature: 15.0, city: "Londdsadaon", precipitation: .Sunny, windSpeed: 6.0, windDirection: .East))
        return array
    }
    
    private func mockWeatherObject(
    temprature: Float!,
    city : String!,
    precipitation: Precipitation!,//осадки
    windSpeed: Float!,
    windDirection: WindDirection!)->Weather{
    let weather = Weather(temprature: temprature, city: city, timeStamp: Date().timeIntervalSince1970, precipitation: precipitation, windSpeed: windSpeed, windDirection: windDirection)
    return weather
        
    }
    
}
