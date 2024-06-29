//
//  Dust.swift
//  DustSwiftUI
//
//  Created by dheum on 2020/07/09.
//  Copyright © 2020 dheum. All rights reserved.
//

import Foundation

struct Data : Codable {
    let ListAirQualityByDistrictService : DustData
}

struct DustData : Codable {
    let row : [Air]
}

struct Air : Codable {
    let MSRDATE : String
    let MSRSTENAME : String
    let GRADE : String // 통합대기환경지수 등급
    let PM10 : String // 미세먼지
    let PM25 : String // 초미세먼지
    let OZONE : String // 오존
    let CARBON : String // 일산화탄소
    let NITROGEN : String // 이산화탄소
}
