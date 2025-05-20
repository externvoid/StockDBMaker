
import Foundation

struct CurrentTradingPeriod: Codable {

  var pre     : Pre?     = Pre()
  var regular : Regular? = Regular()
  var post    : Post?    = Post()

  enum CodingKeys: String, CodingKey {

    case pre     = "pre"
    case regular = "regular"
    case post    = "post"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    pre     = try values.decodeIfPresent(Pre.self     , forKey: .pre     )
    regular = try values.decodeIfPresent(Regular.self , forKey: .regular )
    post    = try values.decodeIfPresent(Post.self    , forKey: .post    )
 
  }

  init() {

  }

}