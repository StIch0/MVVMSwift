//
//  StartViewModel.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 18/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

 class StartViewModel {
    required init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    weak var weatherManager: WeatherManager!
    private var cellsArray = [CityCellViewModel]()
    private var weatherArray : [Weather]!
    var detailViewModel : DetailsViewModel!
    func updateWeather(complection: @escaping ()->Void ){
    cellsArray.removeAll()
        weatherManager.getWeather{
            (weatherArray) in
            self.weatherArray = weatherArray
            for weatherObject in weatherArray{
                self.cellsArray.append(CityCellViewModel(weather: weatherObject))
            }
            complection()
        }
    }
    func numberOfCities()->Int{
        return cellsArray.count
    }
    func cellViewModel(index: Int)->CityCellViewModel?{
        guard index < cellsArray.count else {
            return nil
        }
    return cellsArray[index]
    }
    func detailsViewModel (index: Int)->DetailsViewModel{
        self.detailViewModel = DetailsViewModel(weather: weatherArray[index])
        return self.detailViewModel
    }
    
}
