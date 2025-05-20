
import Foundation

struct Adjclose: Codable {

  var adjclose : [Int]? = []

  enum CodingKeys: String, CodingKey {

    case adjclose = "adjclose"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    adjclose = try values.decodeIfPresent([Int].self , forKey: .adjclose )
 
  }

  init() {

  }

}