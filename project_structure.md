# 📂 ScholarSync Project Structure

This document outlines the folder hierarchy and architectural organization of the ScholarSync Flutter application. Understanding this structure is crucial for maintaining clean code, scaling the app, and ensuring smooth collaboration across the development team.

## 🌳 Directory Tree (Simplified)
```text
scholarsync/
┣ android/          # Native Android build configurations
┣ ios/              # Native iOS build configurations
┣ lib/              # Core Flutter/Dart code
┃ ┣ core/           # Themes, constants, and utilities
┃ ┣ data/           # Models and Firebase repositories
┃ ┣ logic/          # Riverpod state management
┃ ┣ presentation/   # UI screens and widgets
┃ ┗ main.dart       # Application entry point
┣ assets/           # Images, icons, and fonts
┣ test/             # Unit and widget tests
┣ .gitignore        # Files ignored by Git
┣ pubspec.yaml      # Dependencies and assets configuration
┗ README.md         # Project documentation