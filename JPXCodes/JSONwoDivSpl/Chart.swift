
import Foundation

struct Chart: Codable {

  var result : [Result]? = []
  var error  : String?   = nil

  enum CodingKeys: String, CodingKey {

    case result = "result"
    case error  = "error"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    result = try values.decodeIfPresent([Result].self , forKey: .result )
    error  = try values.decodeIfPresent(String.self   , forKey: .error  )
 
  }

  init() {

  }

}