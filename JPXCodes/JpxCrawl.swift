//  Created by Tanaka Hiroshi on 2025/05/18.
import Foundation
func jpxCodeTbl() -> [String] {
  let url = URL(string: "https://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/data_j.xls")!
  // 一時ファイルの保存先
  let tempDir = FileManager.default.temporaryDirectory
  let fileURL = tempDir.appendingPathComponent("data_j.xls")
  // Excelファイルをダウンロード
  let semaphore = DispatchSemaphore(value: 0)

  var downloadedData: Data?
  var downloadError: Error?

  URLSession.shared.dataTask(with: url) { data, response, error in
    if let data = data {
      downloadedData = data
    } else {
      downloadError = error
    }
    semaphore.signal()
  }.resume()

  semaphore.wait()

  guard let data = downloadedData else {
    fatalError("Download failed: \(downloadError?.localizedDescription ?? "unknown error")")
  }

  do {
    try data.write(to: fileURL)
  } catch {
    fatalError("Failed to write file: \(error)")
  }

  // xls2csvで変換
  let process = Process()
  process.executableURL = URL(fileURLWithPath: "/usr/local/bin/xls2csv") // パスは環境によって変わるかもよ
  process.arguments = [fileURL.path]

  let pipe = Pipe()
  process.standardOutput = pipe

  do {
    try process.run()
  } catch {
    fatalError("Failed to run xls2csv: \(error)")
  }

  let outputData = pipe.fileHandleForReading.readDataToEndOfFile()
  guard let csvString = String(data: outputData, encoding: .utf8) else {
    fatalError("Failed to decode CSV output")
  }

  // 改行で配列に分割（文字コードによっては変える必要あるかも！）
  let tmp = csvString.replacingOccurrences(of: "\"", with: "")
  var ar = tmp.components(separatedBy: .newlines)

  // デバッグ用：最初の5行を表示
  ar.remove(at: 0); ar.remove(at: 0)
  return ar
////  for line in ar.prefix(5) {
////    print(line)
//    // print(line.components(separatedBy: ";"))
//  }
}
