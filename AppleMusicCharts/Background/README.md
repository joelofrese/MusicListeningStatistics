# Background
Contains the functions for processing the user data and obtaining data from Apple MUsicKit API, along with the CSVs for testing.

### GetData.swift
Retrieves artist and song data from Apple MusicKit API.
1. Requests user authorization for access to Apple Music.
2. Searches Apple Music catalog for with search pattern "\[song name] \[artist name]" for each song.
3. If first Apple Music song result is a match, retrieves Apple Music song and associate with app song.
4. For each song by an artist, counts times each first-resulting Apple Music artist is a match.
5. For Apple Music artist with most matches, retrieves Apple Music artist and associate with app artist.

### GetTotals.swift
1. Parses through CSV with CSV reader, storing each play as a \[String] of \[artist name, song name, genre].
2. Adds each play to a dictionary associating song (\[String] of \[artist name, song name, genre]) to int of total song plays.
3. Sorts elements in dictionary by highest play count, and converts each to Song struct (../Models/Structures.swift).
4. Sorts dictionary again, but this time by artist, and converts to \[String]: \[\[String]] of \[artist: \[\[artist play count][song, genre, song play count]...]).
7. Sorts elements in dictionary by highest artist play count, and converts each to Artist struct.
8. Returns the sorted arrays of \[Artist] and \[Songs].

### CSV Test 4 copy.csv
- Full test, 127,000+ lines.
- My own personal Apple Music data from 2020, enjoy Beabadoobee!

### CSV Test 7 copy.csv
- Short test, 100+ lines.
- Taken from the beginning of own personal Apple Music data from 2020, live love 2010s pop!
