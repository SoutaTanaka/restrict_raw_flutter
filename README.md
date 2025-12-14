# restrict_raw_flutter

An Analyzer Plugin package that restricts the use of Flutter's standard widgets and promotes the use of custom components from your design system.

This package utilizes the Analyzer Plugins feature added in Dart 3.10 and works with the standard `dart analyze` command.

## Features

This package detects and displays warnings for the use of the following Flutter standard widgets:

- **Text** - Recommends using custom text components
- **Container** - Recommends using custom containers
- **ElevatedButton, TextButton, OutlinedButton** - Recommends using custom buttons
- **Icon** - Recommends using custom icons
- **Image** - Recommends using custom image components
- **Scaffold** - Recommends using custom scaffolds
- **AppBar** - Recommends using custom AppBar
- **ListView, GridView** - Recommends using custom list/grid components
- **TextField, TextFormField** - Recommends using custom input fields
- **Card** - Recommends using custom cards

## Requirements

- Dart SDK: 3.10.0 or higher
- Flutter: 3.38.0 or higher

## Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  restrict_raw_flutter:
    path: ../restrict_raw_flutter  # or appropriate path
```

Then run `dart pub get`.

## Usage

### 1. Configure analysis_options.yaml

Add the following configuration to your project's `analysis_options.yaml`:

```yaml
include: package:flutter_lints/flutter.yaml

plugins:
  restrict_raw_flutter:
    path: ../restrict_raw_flutter  # path to the package
    diagnostics:
      ban_text_widget: true
      ban_container_widget: true
      ban_elevated_button_widget: true
      ban_text_button_widget: true
      ban_outlined_button_widget: true
      ban_icon_widget: true
      ban_image_widget: true
      ban_scaffold_widget: true
      ban_appbar_widget: true
      ban_listview_widget: true
      ban_gridview_widget: true
      ban_textfield_widget: true
      ban_textformfield_widget: true
      ban_card_widget: true
```

### 2. Run Analysis

Execute the standard `dart analyze` or `flutter analyze` command:

```bash
dart analyze
```

or

```bash
flutter analyze
```

### 3. Check Warnings

Warnings will be displayed for locations where standard widgets are used:

```
info • Usage of Text widget is prohibited • lib/main.dart:86:16 • ban_text_widget
info • Usage of Container widget is prohibited • lib/main.dart:42:8 • ban_container_widget
```

## Suppressing Warnings for Specific Locations

If you absolutely need to use standard widgets, you can use ignore comments:

```dart
// ignore: restrict_raw_flutter/ban_text_widget
Text('This is allowed');
```

## References

- [Dart Official Documentation - Analyzer plugins](https://dart.dev/tools/analyzer-plugins)
- [analysis_server_plugin package](https://pub.dev/packages/analysis_server_plugin)
- [Qiita Article - Implementing lint rules with Analyzer plugins, a new feature from Dart 3.10](https://qiita.com/SotaAtos/items/b5eed87dc3311864ce16)

## License

For license information about this package, please refer to the LICENSE file.
