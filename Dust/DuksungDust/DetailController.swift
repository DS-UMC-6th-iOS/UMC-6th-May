//
//  DetailController.swift
//  DuksungDust
//
//  Created by 김서윤 on 6/16/24.
//

import UIKit
import Alamofire

class DetailController: UIViewController {
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    
    var selectedAir: Air?
    var CARBON: String?
    var NITROGEN: String?
    var OZONE: String?
    var PM10: String?
    var PM25: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let context = "일산화탄소: \(CARBON!)\n이산화탄소: \(NITROGEN!)\n오존: \(OZONE!)\n미세먼지: \(PM10!)\n초미세먼지: \(PM25!)"
        infoLabel.text = context
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let currentDate = Int(dateFormatter.string(from: Date())) ?? 0
        
        if currentDate >= 0 && currentDate < 6 {
            self.weatherLabel.text = "not available until 06:00"
        } else {
            getWeather()
        }
    }
    
    func getWeather() -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let currentDate = dateFormatter.string(from: Date())
        let url = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst?serviceKey=Uo2qYuPU61BzLPHvaUL94lDR1dzmJlGppSAv0w4X9L7e7a5umX3U6Hzh335PFfLa2jHNvr5KCrriD3wxuJXNnA%3D%3D&pageNo=1&numOfRows=10&dataType=JSON&stnId=109&tmFc=" + currentDate + "0600";

        AF.request(url).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let value):
                self.parseJson(json: value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseJson(json: String) -> Void {
        let decoder = JSONDecoder()
        if let jsonData = json.data(using: .utf8) {
            let weatherResponse = try? decoder.decode(Weather.self, from: jsonData)
            if let weatherDetail = weatherResponse?.response.body.items.item.first?.wfSv {
                self.weatherLabel.text = weatherDetail
            } else {
                self.weatherLabel.text = "날씨 정보를 가져오지 못했습니다."
            }
        }
    }
}
