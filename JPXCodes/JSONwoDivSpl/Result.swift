
import Foundation

struct Result: Codable {

  var meta       : Meta?       = Meta()
  var timestamp  : [Int]?      = []
  var indicators : Indicators? = Indicators()

  enum CodingKeys: String, CodingKey {

    case meta       = "meta"
    case timestamp  = "timestamp"
    case indicators = "indicators"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    meta       = try values.decodeIfPresent(Meta.self       , forKey: .meta       )
    timestamp  = try values.decodeIfPresent([Int].self      , forKey: .timestamp  )
    indicators = try values.decodeIfPresent(Indicators.self , forKey: .indicators )
 
  }

  init() {

  }

}