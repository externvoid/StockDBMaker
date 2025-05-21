//  Created by Tanaka Hiroshi on 2025/05/20.

import Foundation
// MARK: - Helper Structs for nested objects

// "currentTradingPeriod" の中の "pre", "regular", "post" を表す構造体
struct TradingPeriodDetail: Decodable {
  let timezone: String
  let start: Int // Unixタイムスタンプ
  let end: Int   // Unixタイムスタンプ
  let gmtoffset: Int
}

// "meta" の中の "currentTradingPeriod" を表す構造体
struct CurrentTradingPeriod: Decodable {
  let pre: TradingPeriodDetail
  let regular: TradingPeriodDetail
  let post: TradingPeriodDetail
}

// "meta" を表す構造体
struct Meta: Decodable {
  let currency: String
  let symbol: String
  let exchangeName: String
  let fullExchangeName: String
  let instrumentType: String
  let firstTradeDate: Int // Unixタイムスタンプ
  let regularMarketTime: Int // Unixタイムスタンプ
  let hasPrePostMarketData: Bool
  let gmtoffset: Int
  let timezone: String
  let exchangeTimezoneName: String
  let regularMarketPrice: Double // JSONでは整数だが、価格はDoubleが安全
  let fiftyTwoWeekHigh: Double
  let fiftyTwoWeekLow: Double
  let regularMarketDayHigh: Double? // 同上
  let regularMarketDayLow: Double?  // 同上
  let regularMarketVolume: Int? // !!!: avoid 25935.T error
  let longName: String? // nullの可能性も考慮
  let shortName: String? // nullの可能性も考慮
  let chartPreviousClose: Double
  let priceHint: Int
  let currentTradingPeriod: CurrentTradingPeriod
  let dataGranularity: String
  let range: String
  let validRanges: [String]
}

// "events" の中の "dividends" の詳細を表す構造体
struct DividendEvent: Decodable {
  let amount: Double // JSONでは整数だが、金額はDoubleが安全
  let date: Int    // Unixタイムスタンプ
}

// "events" の中の "splits" の詳細を表す構造体
struct SplitEvent: Decodable {
  let date: Int // Unixタイムスタンプ
  let numerator: Int
  let denominator: Int
  let splitRatio: String
}

// "events" を表す構造体
struct Events: Decodable {
  let dividends: [String: DividendEvent]? // キーがタイムスタンプ文字列
  let splits: [String: SplitEvent]?       // キーがタイムスタンプ文字列
}

// "indicators" の中の "quote" の要素を表す構造体
struct Quote: Decodable {
  let high: [Double?] // nullを含む可能性があるためオプショナル配列
  let volume: [Double?]
  let close: [Double?]
  let low: [Double?]
  let open: [Double?]
}

// "indicators" の中の "adjclose" の要素を表す構造体
struct AdjClose: Decodable {
  let adjclose: [Double?] // nullを含む可能性があるためオプショナル配列
}

// "indicators" を表す構造体
struct Indicators: Decodable {
  let quote: [Quote]?
  let adjclose: [AdjClose]?
}

// "result" 配列の要素を表す構造体
struct ChartResult: Decodable {
  let meta: Meta
  let timestamp: [Int]? // Unixタイムスタンプの配列
  let events: Events?
  let indicators: Indicators
}

// "chart" を表す構造体
struct Chart: Decodable {
  let result: [ChartResult]?
  let error: String? // JSONではnullだが、エラーメッセージが入る可能性も考慮
}

// JSON全体のルートオブジェクトを表す構造体
struct Root: Decodable {
  let chart: Chart
}
