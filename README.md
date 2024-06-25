# iTunesArtists

## Overview
iTunesArtists is an iOS application built using Swift, designed to fetch and display audiobook information from iTunes Search API in a table view format.

## Demo
https://github.com/disha789/iTunesArtists/assets/49581479/6a74370b-9d3d-4e38-9c1c-2bd12540433a

## Features
- Fetches data asynchronously using URLSession.
- Implements MVVM design pattern for clean architecture.
- Uses Codable for JSON decoding.
- Displays audiobooks in a UITableView with custom cells.
- Implements error handling and displays alerts on failures.

## Requirements
- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## Installation
Clone the repository: https://github.com/disha789/iTunesArtists.git

Navigate to the project directory and open `TableViewAPIManager.xcodeproj` in Xcode. Run the project on a simulator or a physical device running iOS 14.0 or later.

## Usage
The app fetches audiobooks from the iTunes Search API and displays them in a list. Users can see details like artist name, country, genre, and price formatted as per locale.

## Project Structure
- `Constants.swift`: Contains all constants used in the app to avoid hard-coded values.
- `Extensions.swift`: Includes a String extension for price formatting.
- `APIManager.swift`: Manages all network requests.
- `ArtistViewModel.swift`: ViewModel for handling the logic of fetching and managing audiobook data.
- `ArtistViewController.swift`: Controls the view layer, updates the UI, and handles user interactions.
- `ArtistTableViewCell.swift`: Custom table view cell to display audiobook information.
- `Tests`: Includes unit tests for the ViewModel.

## Testing
The application includes unit tests for the ViewModel to ensure the data handling is correct. Run the tests using Xcode's test navigator.

## Contributions
Contributions are welcome. Please fork the repository and submit a pull request.
