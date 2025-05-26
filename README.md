J-StockDBMaker
<br><a href="#e-README">English README</a>
<span><img src="https://img.shields.io/badge/Version-0.1-blue">
<img src="https://img.shields.io/badge/platform-macOS-green"></span>
<br>日本証券取引に上場されている銘柄の時系列データをDownloadしSQLite3 Database作成ツール

実行するとstock.dbファイルが本ツールを配置したフォルダに作成されます。ファイルの中身は次のsqlite3コマンドの実行結果のとおりです。
Downloadはとあるデータプロバイダーから行います。データベース作成に要する時間は1hr45min程度です。
銘柄ファイルは東京証券取引所(JPX)が月末に発表するExcelファイルから取得してます。 

```bash
$sqlite3 stock.db
SQLite version 3.43.2 2023-10-10 13:08:14
Enter ".help" for usage hints.
sqlite> SELECT * from '1301' order by date desc limit 5;
date|open|high|low|close|volume|adj
2025-05-21|4365.0|4380.0|4320.0|4350.0|37600.0|4350.0
2025-05-20|4360.0|4385.0|4320.0|4320.0|51400.0|4320.0
2025-05-19|4315.0|4410.0|4310.0|4400.0|51500.0|4400.0
2025-05-16|4415.0|4415.0|4295.0|4330.0|68900.0|4330.0
2025-05-15|4470.0|4505.0|4400.0|4415.0|51300.0|4415.0
sqlite> SELECT count(*) from '1301';
count(*)
6080
sqlite> select * from codeTbl limit 5;
code|name|mkt|sec33|ind33|sec17|ind17|scal|scnm
1301|極洋|プライム（内国株式）|50|水産・農林業|1|食品|7|TOPIX Small 2
1305|ｉＦｒｅｅＥＴＦ　ＴＯＰＩＸ（年１回決算型）|ETF・ETN|-|-|-|-|-|-
1306|ＮＥＸＴ　ＦＵＮＤＳ　ＴＯＰＩＸ連動型上場投信|ETF・ETN|-|-|-|-|-|-
1308|上場インデックスファンドＴＯＰＩＸ|ETF・ETN|-|-|-|-|-|-
1309|ＮＥＸＴ　ＦＵＮＤＳ　ＣｈｉｎａＡＭＣ・中国株式・上証５０連動型上場投信|ETF・ETN|-|-|-|-|-|-
sqlite>
```
依存リポジトリ
[libxls/libxls: Read binary Excel files from C/C++](https://github.com/libxls/libxls)

データプロバイダー

[\[解説\]Pythonを用いた株価・経済データの取得方法をまとめてみた #プログラミング - Qiita](https://qiita.com/aguilarklyno/items/9a1c1a6f5e478c81c725)

<div id="e-README">English README</div>
SQLite3 Database Creation Tool for Time Series Data of Stocks Listed on the Japan Stock Exchange

When executed, the stock.db file will be created in the folder where this tool is placed. The contents of the file are as shown in the result of the following sqlite3 command.

The download is carried out from a certain data provider. It takes approximately 1 hour and 45 minutes to create the database.
The stock lists are obtained from the Excel file published by the Tokyo Stock Exchange (JPX) at the end of each month.

```bash
$sqlite3 stock.db
SQLite version 3.43.2 2023-10-10 13:08:14
Enter ".help" for usage hints.
sqlite> SELECT * from '1301' order by date desc limit 5;
date|open|high|low|close|volume|adj
2025-05-21|4365.0|4380.0|4320.0|4350.0|37600.0|4350.0
2025-05-20|4360.0|4385.0|4320.0|4320.0|51400.0|4320.0
2025-05-19|4315.0|4410.0|4310.0|4400.0|51500.0|4400.0
2025-05-16|4415.0|4415.0|4295.0|4330.0|68900.0|4330.0
2025-05-15|4470.0|4505.0|4400.0|4415.0|51300.0|4415.0
sqlite> SELECT count(*) from '1301';
count(*)
6080
sqlite> select * from ecodeTbl limit 5;
code|name|mkt|sec33|ind33|sec17|ind17|scal|scnm
1301|KYOKUYO CO.,LTD.|Prime Market (Domestic)|50|Fishery, Agriculture and Forestry|1|FOODS|7|TOPIX Small 2
1305|iFreeETF TOPIX (Yearly Dividend Type)|ETFs/ ETNs|-|-|-|-|-|-
1306|NEXT FUNDS TOPIX Exchange Traded Fund|ETFs/ ETNs|-|-|-|-|-|-
1308|Listed Index Fund TOPIX|ETFs/ ETNs|-|-|-|-|-|-
1309|NEXT FUNDS ChinaAMC SSE50 Index Exchange Traded Fund|ETFs/ ETNs|-|-|-|-|-|-
sqlite>
```
Dependency Repository
[libxls/libxls: Read binary Excel files from C/C++](https://github.com/libxls/libxls)

Data Provider

[Beyond Yahoo Finance API: Alternatives for Financial Data](https://www.insightbig.com/post/beyond-yahoo-finance-api-alternatives-for-financial-data)
