# restrict_raw_flutter Example

This example demonstrates how to use the `restrict_raw_flutter` analyzer plugin in a Flutter application.

## Setup

1. Install dependencies:
```bash
flutter pub get
```

2. Run the analyzer:
```bash
flutter analyze
```

## Expected Warnings

This example intentionally uses Flutter's standard widgets that are restricted by the analyzer plugin. When you run `flutter analyze`, you should see warnings for:

- `Text` widget usage
- `Container` widget usage
- `ElevatedButton`, `TextButton`, `OutlinedButton` widget usage
- `Icon` widget usage
- `Image` widget usage
- `Scaffold` widget usage
- `AppBar` widget usage
- `Card` widget usage
- `TextField`, `TextFormField` widget usage
- `GestureDetector`, `InkWell` widget usage
- `Color` class usage
- `Colors` constants usage

## Suppressing Warnings

If you need to use a restricted widget in a specific location, you can suppress the warning using an ignore comment:

```dart
// ignore: restrict_raw_flutter/ban_text_widget
Text('This is allowed');
```

## Running the App

Note: This example is designed to demonstrate the analyzer plugin, not to run as a functional app. The code intentionally uses restricted widgets to show how the analyzer detects them.

