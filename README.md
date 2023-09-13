# Apple Music Charts

## Summary
This Xcode project reads in a spreadsheet given from requesting your Apple Music data from Apple, parses through and processes that data to gather that amount of plays each song and artist has.

![alt text](http://url/to/img.png)

## How It Works (Brief)

1. Parses through the input CSV spreadsheet with a CSV Reader (https://github.com/yaslab/CSV.swift)
2. Groups entries into songs and counts total plays
3. Groups songs into artists and counts total plays
4. Sorts and displays results
5. Uses Apple MusicKit API to get artist images and play songs.

## How to Run

1. Add code to a new Xcode Project for multiplatform.
2. Run via iOS simulator, or run on personal iOS device.

  \* This will use my personal music listening history data requested from 2020, enjoy!

## Learn More
Go into AppleMusicCharts folder to explore the codebase!
