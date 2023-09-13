# Views
SwiftUI files for displaying data in user interface.

### ArtistDetail.swift
- Lists songs by an artist.
- Called when an artist button is pressed.
- Calls SongsList.

### ArtistRow.swift
- Displays an artist row containing artist image, name, play count, and genre in home view.
- Calls CircleImage.

### ArtistsList.swift
- Displays list of artists (ArtistRows) in home view.
- Links ArtistRow to ArtistDetail.

### CircleImage.swift
- Displays image for ArtistRow in home view.
- Called by ArtistRow.

### ContentView.swift
- Called by main program (../AppleMusicChartsApp).
- Calls ArtistsList.

### SongRow.swift
- Displays song name and play count in ArtistDetail view.
- Called by SongsList.

### SongsList.swift
- Displays list of songs (SongRows) in ArtistDetail view.
- Called by ArtistDetail.
