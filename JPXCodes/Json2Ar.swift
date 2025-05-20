//  Created by Tanaka Hiroshi on 2024/12/08.
//  Mod by Tanaka Hiroshi on 2025/05/18Sn.
import Foundation

typealias Candle = (date: String, open: Double, high: Double, low: Double,
                    close: Double, volume: Double, adjclose: Double)
func json2ar(_ json: String) -> [Candle] {

  let decoder = JSONDecoder()
  let hist = try! decoder.decode(Root.self, from: json.data(using: .utf8)!)
  var zr: [[Double]] = []
  var wr: [Candle] = []; var cnt: Int = 0

  if let ar = hist.chart?.result?[0].indicators?.quote?.first {
    if let open = ar.open, let high = ar.high, let low = ar.low,
       let close = ar.close, let volume = ar.volume {
      cnt = open.count
      zr = (0..<cnt).map { i in
        [Double(open[i]), Double(high[i]), Double(low[i]),
         Double(close[i]), Double(volume[i]),]
      }
    }
  }

  if let ar = hist.chart?.result?[0].indicators?.adjclose?.first?.adjclose {
    for i in 0..<cnt {
      zr[i].append(Double(ar[i]))
    }
  }

  let dateFormatter = ISO8601DateFormatter()
  dateFormatter.timeZone = TimeZone(secondsFromGMT: 32400) // UTCに設定


  if let ar = hist.chart?.result?[0].timestamp {
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
  return wr
}
//print(json2ar(json))
