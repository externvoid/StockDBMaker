// US yfinanceからJPX銘柄のヒストリカルデータを得る on 2025/05/18.
// JSONフォルダはdividens, split未対応▶️Fatal error: 'try!' expression unexpectedly raised an error:
import Foundation
import SQLite
// MARK: xls to codeTbl.
let lines_csv: [[String]] = jpxCodeTbl()//.prefix(10)
//let lines = jpxCodeTbl()//.prefix(10)
//let lines = str.components(separatedBy: .newlines) // !!!: for TEST, just 5 rec.
//let lines_csv: [[String]] = lines.map { $0.components(separatedBy: ";") }

//let pathStr: String = #filePath
//let path = URL(fileURLWithPath: pathStr).deletingLastPathComponent().path
#if DEBUG
let path = getSrcsPath()
#else
let path = getExePath()
#endif
let tbl: String = "dateCodeTbl"

let db = try Connection(path + "/stock.db")
print(path + "/stock.db")
try db.execute("""
  drop table if exists \(tbl);
  CREATE TABLE \(tbl) (date text, code text PRIMARY KEY NOT NULL,
  name TEXT, mkt TEXT, sec33 TEXT, ind33 TEXT, sec17 TEXT,
  ind17 TEXT, scal TEXT, scnm TEXT);
"""
)
// create view table
try db.execute("""
    create view if not exists codeTbl(code, name, mkt, sec33, ind33,
    sec17, ind17, scal, scnm) as select
    code, name, mkt, sec33, ind33, sec17, ind17, scal, scnm
    from dateCodeTbl where length(code)=4 and mkt not like '%Pro%';
"""
)

let sql = try db.prepare("insert into \(tbl) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
try db.execute("begin transaction;")
try lines_csv.forEach { e in // date, code, name, ...
  try sql.run(e[0],  e[1], e[2], e[3], e[4], e[5], e[6], e[7], e[8], e[9])
}
try db.execute("end transaction;")

// MARK: Download JSON and Save to 1301 table.
//try [["foo", "25935"]].forEach { e in
try lines_csv.forEach { e in // ???: for product
  let ticker = e[1]
  let ustr = makeUrl(ticker)
//  let ustr = makeUrl2(ticker, "10y")
//  let ustr = makeUrl(ticker, unixTimestamp(2025, 5, 19)) // !!!: period
  //let ustr = makeUrl(ticker, 1747621694)
  // !!!: fetch
  let json = yfetch(ustr); sleep(1)
  let ar: [Candle] = json2ArG(json) // !!!: for Product, just 1301
  if ar.isEmpty { print("safely skipped"); return }
  // !!!: sqlite3
  try db.execute("""
    drop table if exists '\(ticker)';
    CREATE TABLE '\(ticker)' (date text PRIMARY KEY NOT NULL, open real,
    high real, low real, close, volume real, adj real);
  """
  )
//  let ar: [Candle] = json2ArG(json) // !!!: for Product, just 1301
  // !!!: log
  let sub =
  ustr.split(separator: "/chart/").last?.split(separator: "?period1").first
  print("ticker:", String(sub!), "count:", ar.count)

  //let ar: [Candle] = json2ar(json_test) // !!!: for TEST, just 1301
  try db.execute("begin transaction;")
  let sqlI = try db.prepare("insert into '\(ticker)' values (?, ?, ?, ?, ?, ?, ?);")
  try ar.forEach { e in
    try sqlI.run(e.date, e.open, e.high, e.low, e.close, e.volume, e.adjclose)
  }
  try db.execute("end transaction;")
}
//let ustr: String = """
//https://query2.finance.yahoo.com/v8/finance/chart/1301.T?period1=0&period2=1747745000&interval=1d
//"""
// When the record of yfinance will be updated?

// TODO: see below
// 1. let url: String = "https://..."
// 3. line2_csv.forEach { e in
//      let ticker = e[1] + ".T"
//      let url = "     \(ticker)   "
//      let json = String(contentsOf: URL(url), encoding: .utf8)
// 4. ar: [Candle] = json2ar(json)
// 5. create table
// 6. sql
// 7. ar.forEach
//let ticker = "1301"

// create view table
//try db.execute("""
//    create if not exists view codeTbl as select
//    code, name, mkt, sec33, ind33, sec17, ind17, scal, scnm
//    from dateCodeTbl);
//"""
//)
