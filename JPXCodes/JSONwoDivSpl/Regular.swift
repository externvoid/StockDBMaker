
import Foundation

struct Regular: Codable {

  var timezone  : String? = nil
  var start     : Int?    = nil
  var end       : Int?    = nil
  var gmtoffset : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case timezone  = "timezone"
    case start     = "start"
    case end       = "end"
    case gmtoffset = "gmtoffset"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    timezone  = try values.decodeIfPresent(String.self , forKey: .timezone  )
    start     = try values.decodeIfPresent(Int.self    , forKey: .start     )
    end       = try values.decodeIfPresent(Int.self    , forKey: .end       )
    gmtoffset = try values.decodeIfPresent(Int.self    , forKey: .gmtoffset )
 
  }

  init() {

  }

}