
import Foundation

struct Quote: Codable {

  var low    : [Int]? = []
  var open   : [Int]? = []
  var close  : [Int]? = []
  var volume : [Int]? = []
  var high   : [Int]? = []

  enum CodingKeys: String, CodingKey {

    case low    = "low"
    case open   = "open"
    case close  = "close"
    case volume = "volume"
    case high   = "high"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    low    = try values.decodeIfPresent([Int].self , forKey: .low    )
    open   = try values.decodeIfPresent([Int].self , forKey: .open   )
    close  = try values.decodeIfPresent([Int].self , forKey: .close  )
    volume = try values.decodeIfPresent([Int].self , forKey: .volume )
    high   = try values.decodeIfPresent([Int].self , forKey: .high   )
 
  }

  init() {

  }

}