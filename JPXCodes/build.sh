Proj="JPXCodes"
Scheme="stockDBMaker"
time xcodebuild -target $Proj -configuration Release -scheme $Scheme archive -archivePath ./build/build

afplay /System/Library/Sounds/Ping.aiff

