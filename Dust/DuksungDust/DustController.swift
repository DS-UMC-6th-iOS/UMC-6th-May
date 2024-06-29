//
//  DustController.swift
//  DustStoryBoard
//

import UIKit
import Alamofire

class DustController: UIViewController {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var dustTable: UITableView!
    @IBOutlet var maxminLabel: UILabel!
    var airArray: [Air] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDusts()
    }
    
    @IBAction func refresh(_ sender: Any) {
        self.airArray.removeAll()
        self.getDusts()
        
    }
    
    func getDusts() -> Void {
        let url = "http://openapi.seoul.go.kr:8088/536c6b6941706f6f343178536a5a41/json/" +
                        "ListAirQualityByDistrictService/1/25/";

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
        let data = json.data(using: .utf8)
        if let data = data, let obj = try? decoder.decode(Data.self, from: data) {
            self.airArray = obj.ListAirQualityByDistrictService.row
        }
        self.dustTable.reloadData()
        if airArray.count != 0 {
            let str = String(airArray[0].MSRDATE.dropLast(2))
            
            let dateStr = String(str.prefix(8))
            let timeSrt = String(str.suffix(2))
                    
            self.dateLabel.text = "\(dateStr)일 \(timeSrt)시 기준"
            
            var maxPM10: Int? = nil
            var minPM10: Int? = nil
            
            for air in airArray {
                if let pm10 = Int(air.PM10) {
                    if maxPM10 == nil || pm10 > maxPM10! {
                        maxPM10 = pm10
                    }
                    if minPM10 == nil || pm10 < minPM10! {
                        minPM10 = pm10
                    }
                }
            }
            
            self.maxminLabel.text = "최고: \(String(maxPM10!)) / 최저: \(String(minPM10!))"
        }
    }
}

extension DustController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.airArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "DustCell", for: indexPath)
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = self.airArray[indexPath.row].MSRSTENAME
        }
        if let label = cell.contentView.viewWithTag(2) as? UILabel {
            label.text = self.airArray[indexPath.row].PM10
        }
        if let label = cell.contentView.viewWithTag(3) as? UILabel {
            if self.airArray[indexPath.row].GRADE == "" {
                label.text = "N/A"
            } else {
                label.text = self.airArray[indexPath.row].GRADE
            }
        }
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destController = segue.destination as? DetailController, let indexPath = dustTable.indexPathForSelectedRow else {
            return
        }
        
        let selectedAir = airArray[indexPath.row]
        destController.selectedAir = selectedAir
        destController.navigationItem.title = selectedAir.MSRSTENAME + " 세부정보"
        
        destController.CARBON = self.airArray[indexPath.row].CARBON
        destController.NITROGEN = self.airArray[indexPath.row].NITROGEN
        destController.OZONE = self.airArray[indexPath.row].OZONE
        destController.PM10 = self.airArray[indexPath.row].PM10
        destController.PM25 = self.airArray[indexPath.row].PM25
    }
}

