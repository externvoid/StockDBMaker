//  Created by Tanaka Hiroshi on 2025/05/20.
import Foundation

typealias Candle = (date: String, open: Double, high: Double, low: Double,
                    close: Double, volume: Double, adjclose: Double)
typealias Candle0 = (date: String, open: Double?, high: Double?, low: Double?,
                    close: Double?, volume: Double?, adjclose: Double?)
// !!!: func
func json2ArG(_ json: String) -> [Candle] {

  let decoder = JSONDecoder()
  var hist: Root? = nil
  do {
    hist = try decoder.decode(Root.self, from: json.data(using: .utf8)!)

  } catch {
    print("error@json2ArG: \(error)")
    return []
  }
  var zr: [[Double?]] = []
  var wr: [Candle0] = []; var cnt: Int = 0

  if let ar = hist!.chart.result?[0].indicators.quote?.first {
    let open = ar.open; let high = ar.high; let low = ar.low;
    let close = ar.close; let volume = ar.volume
    cnt = open.count
    zr = (0..<cnt).map { i in
      [open[i], high[i], low[i], close[i], volume[i],]
    }
  }

  if let ar = hist!.chart.result?[0].indicators.adjclose?.first?.adjclose {
    for i in 0..<cnt {
      zr[i].append(ar[i])
    }
  }

  let dateFormatter = ISO8601DateFormatter()
  dateFormatter.timeZone = TimeZone(secondsFromGMT: 32400) // UTCに設定


  if let ar = hist!.chart.result?[0].timestamp {
    let utc: [String] = ar.map { timeInterval in
      let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
      return dateFormatter.string(from: date)
    }
    for i in 0..<cnt {
      let jst = utc[i].components(separatedBy: "T").first!
      let candle = (date: jst, open: zr[i][0], high: zr[i][1], low: zr[i][2],
                    close: zr[i][3], volume: zr[i][4], adjclose: zr[i][5])
      wr.append(candle)

    }
  }
  return wr.compactMap { e in
    guard let o = e.open, let h = e.high, let l = e.low,
          let c = e.close, let v = e.volume, let a = e.adjclose else { return nil }
    return (Candle(date: e.date, open: o, high: h, low: l, close: c, volume: v, adjclose: a))
  }
}
