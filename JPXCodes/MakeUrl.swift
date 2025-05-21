//
//  MakeTicker.swift
//  JPXCodes
//
//  Created by Tanaka Hiroshi on 2025/05/21.
//
import Foundation

func makeUrl(_ ticker: String, _ period1: Int = 0,
                _ period2: Int = Int(Date().timeIntervalSince1970),
                _ interval: String = "1d") -> String {

  let urlBase: String = "https://query2.finance.yahoo.com/v8/finance/chart/\(ticker).T"
  let queryStr: String = "?period1=\(period1)&period2=\(period2)&interval=\(interval)"

  return urlBase + queryStr
}
func makeUrl2(_ ticker: String, _ range: String = "1mo",
                _ interval: String = "1d") -> String {

  let urlBase: String = "https://query2.finance.yahoo.com/v8/finance/chart/\(ticker).T"
  let queryStr: String = "?range=\(range)&interval=\(interval)"
  
  return urlBase + queryStr
}
//let ticker: String = "1301"
//let range: String = "6mo"
//let interval: String = "1d"
//let urlBase: String = "https://query2.finance.yahoo.com/v8/finance/chart/\(ticker).T"
//var queryStr: String = "?range=\(range)&interval=\(interval)"
////let ustr: String = urlBase + queryStr
//let period: Int = Int(Date().timeIntervalSince1970)
//queryStr = "?period1=1747621694&period2=\(period)&interval=\(interval)"
//let ustr: String = urlBase + queryStr
func unixTimestamp(_ yr: Int, _ mo: Int, _ dy: Int) -> Int {
  var dateComponents = DateComponents()
  dateComponents.year = yr
  dateComponents.month = mo
  dateComponents.day = dy
  dateComponents.hour = 9
  dateComponents.minute = 0
  dateComponents.second = 0

  // 東京（JST）のタイムゾーン
  let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
  var calendar = Calendar(identifier: .gregorian)
  calendar.timeZone = tokyoTimeZone

  if let date = calendar.date(from: dateComponents) {
    return Int(date.timeIntervalSince1970)
  } else {
    // 無効な日付（例: 2月30日）なら -1 を返す
    return -1
  }
}
//print(unixTimestamp(2025, 5, 21)) // JST 2025年5月21日9時のUNIX時刻 1747785600
