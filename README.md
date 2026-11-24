# News App

A Flutter news reader that aggregates live headlines from NewsAPI, organized by category and source, with full-text search and in-app article reading.

## Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/17-news-1.webp" width="170" alt="News app screenshot 1">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/18-news-2.webp" width="170" alt="News app screenshot 2">
</p>

## Features

- Browse news by category (business, entertainment, general, science, sports, technology)
- Per-source tab bar inside each category
- Full-text article search
- Article details with in-app web view for the full story
- Light and dark themes
- English and Arabic localization
- Loading shimmer placeholders and cached article images

## Tech Stack

- **Flutter** / Dart
- **State management:** Provider
- **Networking:** http (NewsAPI)
- **Localization:** easy_localization
- **UI:** google_fonts, flutter_svg, shimmer, cached_network_image
- **Reading:** webview_flutter

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedWalied26/News_App.git
   cd News_App
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Get a free API key from [newsapi.org](https://newsapi.org) and set it in `lib/api/api_constant.dart`.
4. Run the app:
   ```bash
   flutter run
   ```
