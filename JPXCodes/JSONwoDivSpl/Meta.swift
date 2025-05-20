
import Foundation

struct Meta: Codable {

  var currency             : String?               = nil
  var symbol               : String?               = nil
  var exchangeName         : String?               = nil
  var fullExchangeName     : String?               = nil
  var instrumentType       : String?               = nil
  var firstTradeDate       : Int?                  = nil
  var regularMarketTime    : Int?                  = nil
  var hasPrePostMarketData : Bool?                 = nil
  var gmtoffset            : Int?                  = nil
  var timezone             : String?               = nil
  var exchangeTimezoneName : String?               = nil
  var regularMarketPrice   : Int?                  = nil
  var fiftyTwoWeekHigh     : Int?                  = nil
  var fiftyTwoWeekLow      : Int?                  = nil
  var regularMarketDayHigh : Int?                  = nil
  var regularMarketDayLow  : Int?                  = nil
  var regularMarketVolume  : Int?                  = nil
  var longName             : String?               = nil
  var shortName            : String?               = nil
  var chartPreviousClose   : Int?                  = nil
  var priceHint            : Int?                  = nil
  var currentTradingPeriod : CurrentTradingPeriod? = CurrentTradingPeriod()
  var dataGranularity      : String?               = nil
  var range                : String?               = nil
  var validRanges          : [String]?             = []

  enum CodingKeys: String, CodingKey {

    case currency             = "currency"
    case symbol               = "symbol"
    case exchangeName         = "exchangeName"
    case fullExchangeName     = "fullExchangeName"
    case instrumentType       = "instrumentType"
    case firstTradeDate       = "firstTradeDate"
    case regularMarketTime    = "regularMarketTime"
    case hasPrePostMarketData = "hasPrePostMarketData"
    case gmtoffset            = "gmtoffset"
    case timezone             = "timezone"
    case exchangeTimezoneName = "exchangeTimezoneName"
    case regularMarketPrice   = "regularMarketPrice"
    case fiftyTwoWeekHigh     = "fiftyTwoWeekHigh"
    case fiftyTwoWeekLow      = "fiftyTwoWeekLow"
    case regularMarketDayHigh = "regularMarketDayHigh"
    case regularMarketDayLow  = "regularMarketDayLow"
    case regularMarketVolume  = "regularMarketVolume"
    case longName             = "longName"
    case shortName            = "shortName"
    case chartPreviousClose   = "chartPreviousClose"
    case priceHint            = "priceHint"
    case currentTradingPeriod = "currentTradingPeriod"
    case dataGranularity      = "dataGranularity"
    case range                = "range"
    case validRanges          = "validRanges"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    currency             = try values.decodeIfPresent(String.self               , forKey: .currency             )
    symbol               = try values.decodeIfPresent(String.self               , forKey: .symbol               )
    exchangeName         = try values.decodeIfPresent(String.self               , forKey: .exchangeName         )
    fullExchangeName     = try values.decodeIfPresent(String.self               , forKey: .fullExchangeName     )
    instrumentType       = try values.decodeIfPresent(String.self               , forKey: .instrumentType       )
    firstTradeDate       = try values.decodeIfPresent(Int.self                  , forKey: .firstTradeDate       )
    regularMarketTime    = try values.decodeIfPresent(Int.self                  , forKey: .regularMarketTime    )
    hasPrePostMarketData = try values.decodeIfPresent(Bool.self                 , forKey: .hasPrePostMarketData )
    gmtoffset            = try values.decodeIfPresent(Int.self                  , forKey: .gmtoffset            )
    timezone             = try values.decodeIfPresent(String.self               , forKey: .timezone             )
    exchangeTimezoneName = try values.decodeIfPresent(String.self               , forKey: .exchangeTimezoneName )
    regularMarketPrice   = try values.decodeIfPresent(Int.self                  , forKey: .regularMarketPrice   )
    fiftyTwoWeekHigh     = try values.decodeIfPresent(Int.self                  , forKey: .fiftyTwoWeekHigh     )
    fiftyTwoWeekLow      = try values.decodeIfPresent(Int.self                  , forKey: .fiftyTwoWeekLow      )
    regularMarketDayHigh = try values.decodeIfPresent(Int.self                  , forKey: .regularMarketDayHigh )
    regularMarketDayLow  = try values.decodeIfPresent(Int.self                  , forKey: .regularMarketDayLow  )
    regularMarketVolume  = try values.decodeIfPresent(Int.self                  , forKey: .regularMarketVolume  )
    longName             = try values.decodeIfPresent(String.self               , forKey: .longName             )
    shortName            = try values.decodeIfPresent(String.self               , forKey: .shortName            )
    chartPreviousClose   = try values.decodeIfPresent(Int.self                  , forKey: .chartPreviousClose   )
    priceHint            = try values.decodeIfPresent(Int.self                  , forKey: .priceHint            )
    currentTradingPeriod = try values.decodeIfPresent(CurrentTradingPeriod.self , forKey: .currentTradingPeriod )
    dataGranularity      = try values.decodeIfPresent(String.self               , forKey: .dataGranularity      )
    range                = try values.decodeIfPresent(String.self               , forKey: .range                )
    validRanges          = try values.decodeIfPresent([String].self             , forKey: .validRanges          )
 
  }

  init() {

  }

}