# Mandiri News App

This Flutter application fetches news articles from an API and displays them in a user-friendly interface. Below is a breakdown of the code structure and its functionalities:

## Table of Contents

- [Introduction](#introduction)
- [Dependencies](#dependencies)
- [File Structure](#file-structure)
- [How to Use](#how-to-use)

## Introduction

The Mandiri News App allows users to stay updated with the latest news. It fetches data from the [News API](https://newsapi.org/), presenting top headlines and everything news articles. The app utilizes Flutter and Provider package for state management.

## Dependencies

- [Dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart, used for making network requests.
- [Intl](https://pub.dev/packages/intl): Provides internationalization and localization support, used for date formatting.

## File Structure

- **lib/main.dart**: Entry point of the application. Sets up the main UI and initializes the Provider for managing news data.
- **lib/utils/const.dart**: Contains constant values like API base URL and API key.
- **lib/providers/news.provider.dart**: Defines a Provider class to manage news data fetching and state.
- **lib/pages/articles_details_page.dart**: Displays details of a selected news article.
- **lib/models/topNews.model.dart**: Defines data models for news articles and sources.
- **lib/helpers/api.dart**: Contains a function for making API requests using Dio.
- **lib/components/customListTile.dart**: Widget for displaying individual top news articles with a custom design.
- **lib/components/everythingList.dart**: Widget for displaying individual everything news articles with a custom design.

## How to Use

To run the Mandiri News App:

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed on your machine.
3. Navigate to the project directory and run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.