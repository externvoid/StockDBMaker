//  Created by Tanaka Hiroshi on 2025/05/25.
import Foundation
func dlXLS() -> String {
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
  return fileURL.path
}
