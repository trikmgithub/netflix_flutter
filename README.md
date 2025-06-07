# Netflix Clone

A Netflix clone application built with Flutter that mimics the core functionalities and UI of the Netflix streaming service.

![Netflix Clone](assets/images/splash-bg.png)

## Features

- **Authentication**: User registration and login functionality
- **Home Screen**: Display of trending, popular, and recommended content
- **Watch Screen**: Video playback capabilities
- **Movie/TV Show Categories**: Browse content by categories
- **Search Functionality**: Find your favorite movies and TV shows
- **Responsive UI**: Works on both mobile and tablet devices

## Architecture

This application follows a clean architecture approach with:

- **BLoC Pattern**: For state management
- **Repository Pattern**: For data handling
- **Dependency Injection**: Using get_it for service locator
- **Clean Code Structure**: Separation of concerns with presentation, domain, and data layers

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── service_locator.dart      # Dependency injection setup
├── common/                   # Common utilities and widgets
├── core/                     # Core functionality and configs
├── data/                     # Data layer (repositories implementation)
├── domain/                   # Domain layer (entities, repositories interfaces)
└── presentation/             # UI layer (screens, widgets, blocs)
```

## Technologies Used

- **Flutter**: UI framework
- **flutter_bloc**: State management
- **dio**: HTTP client
- **get_it**: Dependency injection
- **shared_preferences**: Local storage
- **flutter_svg**: SVG rendering
- **chewie & video_player**: Video playback
- **youtube_player_flutter**: YouTube video integration
- **fan_carousel_image_slider**: Image carousel

## Getting Started

### Prerequisites

- Flutter SDK: 3.7 or higher
- Dart SDK: 3.7 or higher
- Android Studio or VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/netflix-clone.git
   ```

2. Navigate to the project directory:
   ```
   cd netflix
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   flutter run
   ```

## Screenshots

[Include screenshots of your application here]

## Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/amazing-feature`)
3. Commit your Changes (`git commit -m 'Add some amazing feature'`)
4. Push to the Branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- UI inspiration from Netflix
- Flutter and Dart documentation
- Various Flutter packages and their contributors
