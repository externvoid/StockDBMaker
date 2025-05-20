
import Foundation

struct Indicators: Codable {

  var quote    : [Quote]?    = []
  var adjclose : [Adjclose]? = []

  enum CodingKeys: String, CodingKey {

    case quote    = "quote"
    case adjclose = "adjclose"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    quote    = try values.decodeIfPresent([Quote].self    , forKey: .quote    )
    adjclose = try values.decodeIfPresent([Adjclose].self , forKey: .adjclose )
 
  }

  init() {

  }

}