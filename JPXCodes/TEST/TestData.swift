let json_test: String = """
{"chart":{"result":[{"meta":{"currency":"JPY","symbol":"1301.T","exchangeName":"JPX","fullExchangeName":"Tokyo","instrumentType":"EQUITY","firstTradeDate":978307200,"regularMarketTime":1733467502,"hasPrePostMarketData":false,"gmtoffset":32400,"timezone":"JST","exchangeTimezoneName":"Asia/Tokyo","regularMarketPrice":4015,"fiftyTwoWeekHigh":4600,"fiftyTwoWeekLow":3400,"regularMarketDayHigh":4035,"regularMarketDayLow":4000,"regularMarketVolume":14700,"longName":"Kyokuyo Co., Ltd.","shortName":"KYOKUYO CO LTD","chartPreviousClose":4035,"priceHint":2,"currentTradingPeriod":{"pre":{"timezone":"JST","start":1733443200,"end":1733443200,"gmtoffset":32400},"regular":{"timezone":"JST","start":1733443200,"end":1733466600,"gmtoffset":32400},"post":{"timezone":"JST","start":1733466600,"end":1733466600,"gmtoffset":32400}},"dataGranularity":"1d","range":"1mo","validRanges":["1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"]},"timestamp":[1730851200,1730937600,1731024000,1731283200,1731369600,1731456000,1731542400,1731628800,1731888000,1731974400,1732060800,1732147200,1732233600,1732492800,1732579200,1732665600,1732752000,1732838400,1733097600,1733184000,1733270400,1733356800,1733443200],"indicators":{"quote":[{"low":[4000,3995,3995,3975,3990,3935,3905,3940,3960,3995,3975,3940,3890,3935,3900,3870,3895,3910,3910,3980,3975,4005,4000],"open":[4125,4065,4015,3995,3990,4000,3950,3955,3960,3995,4045,3980,3945,3940,3930,3935,3900,3930,3910,4000,4010,4020,4020],"close":[4035,4035,4035,3975,4000,3950,3930,3970,3975,4030,3980,3960,3940,3950,3915,3890,3925,3910,3970,4015,3980,4015,4015],"volume":[100400,47200,43300,21800,19200,48400,25800,18000,14000,21100,20800,16400,30400,30700,23500,21500,14100,13700,17200,30400,25800,17900,14700],"high":[4190,4080,4065,4030,4030,4015,3955,3995,3990,4045,4045,4000,3945,3980,3965,3935,3925,3950,3980,4035,4025,4035,4035]}],"adjclose":[{"adjclose":[4035,4035,4035,3975,4000,3950,3930,3970,3975,4030,3980,3960,3940,3950,3915,3890,3925,3910,3970,4015,3980,4015,4015]}]}}],"error":null}}
"""

//  Created by Tanaka Hiroshi on 2025/05/19.
// https://query2.finance.yahoo.com/v8/finance/chart/6309.T?range=1mo&interval=1d&events=split%7Cdiv

let json_test2: String = """
{
  "chart": {
    "result": [
      {
        "meta": {
          "currency": "JPY",
          "symbol": "6309.T",
          "exchangeName": "JPX",
          "fullExchangeName": "Tokyo",
          "instrumentType": "EQUITY",
          "firstTradeDate": 1098662400,
          "regularMarketTime": 1747636200,
          "hasPrePostMarketData": false,
          "gmtoffset": 32400,
          "timezone": "JST",
          "exchangeTimezoneName": "Asia/Tokyo",
          "regularMarketPrice": 1403,
          "fiftyTwoWeekHigh": 1666.667,
          "fiftyTwoWeekLow": 1123.333,
          "regularMarketDayHigh": 1431,
          "regularMarketDayLow": 1402,
          "regularMarketVolume": 105500,
          "longName": "Tomoe Engineering Co., Ltd.",
          "shortName": "TOMOE ENGINEERING CO",
          "chartPreviousClose": 1431.667,
          "priceHint": 2,
          "currentTradingPeriod": {
            "pre": {
              "timezone": "JST",
              "start": 1747612800,
              "end": 1747612800,
              "gmtoffset": 32400
            },
            "regular": {
              "timezone": "JST",
              "start": 1747612800,
              "end": 1747636200,
              "gmtoffset": 32400
            },
            "post": {
              "timezone": "JST",
              "start": 1747636200,
              "end": 1747636200,
              "gmtoffset": 32400
            }
          },
          "dataGranularity": "1d",
          "range": "1mo",
          "validRanges": [
            "1d",
            "5d",
            "1mo",
            "3mo",
            "6mo",
            "1y",
            "2y",
            "5y",
            "10y",
            "ytd",
            "max"
          ]
        },
        "timestamp": [1745193600, 1745280000, 1745366400, 1745452800, 1745539200, 1745798400, 1745971200, 1746057600, 1746144000, 1746576000, 1746662400, 1746748800, 1747008000, 1747094400, 1747180800, 1747267200, 1747353600, 1747636200],
        "events": {
          "dividends": {
            "1745798400": {
              "amount": 73,
              "date": 1745798400
            }
          },
          "splits": {
            "1745798400": {
              "date": 1745798400,
              "numerator": 3,
              "denominator": 1,
              "splitRatio": "3:1"
            }
          }
        },
        "indicators": {
          "quote": [
            {
              "high": [1443.33337402344, 1421.66662597656, 1425, 1413.33337402344, 1411.66662597656, 1378, 1388, 1364, 1368, 1363, 1372, 1389, 1412, 1413, 1420, 1403, 1411, 1431],
              "volume": [149700, 154200, 179700, 186600, 183600, 236500, 125200, 64700, 67700, 93100, 77700, 80000, 123300, 71300, 82700, 47700, 68700, 105500],
              "close": [1428.33337402344, 1408.33337402344, 1401.66662597656, 1393.33337402344, 1403.33337402344, 1378, 1383, 1359, 1355, 1353, 1370, 1377, 1409, 1413, 1400, 1383, 1409, 1403],
              "low": [1415, 1401.66662597656, 1400, 1393.33337402344, 1393.33337402344, 1333, 1350, 1345, 1346, 1336, 1353, 1374, 1377, 1396, 1364, 1375, 1380, 1402],
              "open": [1435, 1420, 1423.33337402344, 1403.33337402344, 1393.33337402344, 1349, 1375, 1360, 1347, 1344, 1353, 1374, 1377, 1413, 1407, 1388, 1383, 1407]
            }
          ],
          "adjclose": [
            {
              "adjclose": [1354.03295898438, 1335.0732421875, 1328.75329589844, 1320.853515625, 1330.33337402344, 1378, 1383, 1359, 1355, 1353, 1370, 1377, 1409, 1413, 1400, 1383, 1409, 1403]
            }
          ]
        }
      }
    ],
    "error": null
  }
}

"""
