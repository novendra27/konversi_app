## konversi_app

This app allows users to search forex data by currency or country and perform forex conversions.

## How to run the app

1. Clone this repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to download the dependencies.
4. Run the application with `flutter run`.

## Tools version

1. Flutter 3.22.1
2. Dart 3.4.1

## Project structure

- `lib/`
  - `models/`: contains the data model.
  - `controllers/`: contains the data retrieval logic.
  - `views/`: contains the user interface.
  - `theme/`: contains the assets color pallete.
  - `main.dart`: contains the main settings of the application.

## Algorithm flow

- Main Algorithm: Display Views -> Algorithm API -> Display Data -> User Interaction -> Algorithm API -> Process Data -> Display Results.
- API Algorithm: Accessing API -> Parsing JSON Data into Model Object.

## Interface app

- Home page:
![Home page](https://github.com/novendra27/konversi_app/tree/main/screenshots/home_page_screenshot.jpg)

- Conversion page:
![Conversion page](https://github.com/novendra27/konversi_app/tree/main/screenshots/conversion_page_screenshot.jpg)
