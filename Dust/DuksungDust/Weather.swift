//
//  Weather.swift
//  DuksungDust
//
//  Created by 김서윤 on 6/16/24.
//

import Foundation

struct Weather : Codable {
    let response : WeatherData
}

struct WeatherData : Codable {
    let body: WeatherItems
}

struct WeatherItems: Codable {
    let items: WeatherItem
}

struct WeatherItem: Codable {
    let item: [WeatherDetail]
}

struct WeatherDetail: Codable {
    let wfSv: String
}
