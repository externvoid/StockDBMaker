//  Created by Tanaka Hiroshi on 2025/05/25.
import Foundation

func chked(_ str: String) -> String {
  // 文字列が数字とピリオドのみで構成されているかチェック
  if str.range(of: "^[0-9.]+$", options: .regularExpression) != nil {
    // ピリオドで分割して整数部分を取得
    let components = str.split(separator: ".")
    if let intPart = components.first {
//      print(intPart) // 出力: 20250430
      return String(intPart)
    } else {
//      print("整数部分の変換に失敗")
      return str
    }
  } else {
//    print("文字列が数字とピリオドのみで構成されていません")
    return str
  }
}
//let str: String = "20250430.000000"

func jpxCodeTbl() -> [[String]] {
  var error: xls_error_t = LIBXLS_OK
  var ar: [[String]] = []

  // Excel WorkBook
  guard let wb = xls_open_file(dlXLS(), "UTF-8", &error) else {
    if let errorStr = xls_getError(error) {
      let str = String(cString: errorStr)
      print("Error reading file: \(str)")
    } else {
      print("Unknown error.")
    }
    exit(1)
  }

  for i in 0..<Int(wb.pointee.sheets.count) {
    guard let ws = xls_getWorkSheet(wb, Int32(i)) else {
      print("Failed to get worksheet \(i)")
      continue
    }

    error = xls_parseWorkSheet(ws)
    if error != LIBXLS_OK {
      print("Error parsing worksheet \(i)")
      xls_close_WS(ws)
      continue
    }

    let lastRow = Int(ws.pointee.rows.lastrow)
    let lastCol = Int(ws.pointee.rows.lastcol)
    for j in 0...lastRow {
      guard let row = xls_row(ws, UInt16(j)) else {
        continue
      }
      var rows: [String] = []
      for k in 0...lastCol {
        let cellPtr = row.pointee.cells.cell.advanced(by: k)
        let cell = cellPtr.pointee

        switch cell.id {
          case UInt16(XLS_RECORD_BLANK):
            print("Blank cell at (\(j), \(k))")
          case UInt16(XLS_RECORD_NUMBER):
            print("Number at (\(j), \(k)): \(cell.d)")
          case UInt16(XLS_RECORD_FORMULA):
            if let strPtr = cell.str {
              let str = String(cString: strPtr)
              if str == "bool" {
                print("Boolean at (\(j), \(k)): \(cell.d > 0.0 ? "true" : "false")")
              } else if str == "error" {
                print("Error formula at (\(j), \(k))")
              } else {
                print("Formula string at (\(j), \(k)): \(str)")
              }
            }
          default:
            if let strPtr = cell.str {
              let str = String(cString: strPtr)
              let chked: String = chked(str)
              //            print("String at (\(j), \(k)): \(chked)")
              rows.append(chked)
            }
        }
      } // k-loop
      ar.append(rows)
    } // j-loop
    xls_close_WS(ws)
  }

  xls_close_WB(wb)
//  print(ar.prefix(5))
  return ar

}
