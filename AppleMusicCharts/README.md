# About The Codebase
Below is a description of what is contained in each file / folder.

### AppleMusicChartsApp.swift
This is the main program of the code, and calls the necessary functions for the app to run.
1. Calls getTotals function (Background/getTotals.swift) to start processing user data.
2. Calls ContentView (Views/ContentView.swift) to display artists in UI.
3. Calls getArtistsData to get artist and song data from Apple MusicKit API.

### Background
Contains the functions for processing the user data and obtaining data from Apple MUsicKit API.

### Models
Contains the structs used in the program.

### Views
Contains the SwiftUI views for displaying the user interface in the app.
