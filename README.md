# Notes App (Flutter)

A simple and convenient Flutter notes application with local storage, search, and editing capabilities.

This project demonstrates practical Flutter development skills including UI building, local data persistence, state management, and a structured project architecture.

## Features

- Create notes — add new notes with a single tap
- Edit notes — update the content of existing notes
- Delete notes — remove notes you no longer need
- Search notes — quickly find notes by their content
- Creation date — each note displays its creation date
- Random note colors — each note card has a random background color
- Local storage — all notes are stored locally using Hive

## Tech Stack

- Flutter / Dart
- Hive / hive_flutter — local database for storing notes
- flutter_bloc / bloc — state management using the BLoC pattern
- provider — dependency injection
- intl — date formatting and localization
- flutter_slidable — slide actions for list items (for example deleting notes)

## Project Structure

lib/
├── main.dart — application entry point and Hive initialization
├── domain/
│   └── entity/
│       ├── notes.dart
│       └── notes.g.dart
├── ui/
│   ├── navigation/ — navigation configuration and route names
│   └── widgets/
│       ├── main_screen/ — main screen with notes list and search
│       ├── notes_screen/ — note creation and editing screen
│       └── blanks_for_style.dart — shared styles and colors

## Getting Started

Clone the repository and install dependencies:

flutter pub get

Generate Hive files if necessary:

flutter pub run build_runner build --delete-conflicting-outputs

Run the application:

flutter run

The required Dart SDK version is defined in pubspec.yaml:

>=3.3.1 <4.0.0

## Roadmap

Planned improvements for future versions:

- Add tags or categories for notes
- Add filters and sorting (by date, color, etc.)
- Add archive functionality
- Add dark theme support
- Improve UI and animations

## Notes

This repository is a learning and portfolio project created to demonstrate Flutter development skills such as local data storage, state management, and building practical mobile applications.