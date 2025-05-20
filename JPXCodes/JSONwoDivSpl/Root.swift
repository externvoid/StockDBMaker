
import Foundation

struct Root: Codable {

  var chart : Chart? = Chart()

  enum CodingKeys: String, CodingKey {

    case chart = "chart"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    chart = try values.decodeIfPresent(Chart.self , forKey: .chart )
 
  }

  init() {

  }

}
