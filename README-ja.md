# restrict_raw_flutter

Flutterの標準Widgetの使用を制限し、デザインシステムのカスタムコンポーネントの使用を促進するためのAnalyzer Pluginパッケージです。

Dart 3.10で追加されたAnalyzer Plugins機能を利用しており、標準の `dart analyze` コマンドで動作します。

## 機能

このパッケージは以下のFlutter標準Widgetの使用を検出し、警告を表示します：

- **Text** - カスタムテキストコンポーネントの使用を推奨
- **Container** - カスタムコンテナの使用を推奨
- **ElevatedButton, TextButton, OutlinedButton** - カスタムボタンの使用を推奨
- **Icon** - カスタムアイコンの使用を推奨
- **Image** - カスタム画像コンポーネントの使用を推奨
- **Scaffold** - カスタムスキャフォールドの使用を推奨
- **AppBar** - カスタムAppBarの使用を推奨
- **ListView, GridView** - カスタムリスト/グリッドの使用を推奨
- **TextField, TextFormField** - カスタム入力フィールドの使用を推奨
- **Card** - カスタムカードの使用を推奨
- **Colors** - デザインシステムのカスタム色定義の使用を推奨
- **Color** - Colorコンストラクタの代わりにカスタム色定義の使用を推奨

## 環境要件

- Dart SDK: 3.10.0 以上
- Flutter: 3.38.0 以上

## インストール

`pubspec.yaml` に以下の依存関係を追加してください：

```yaml
dev_dependencies:
  restrict_raw_flutter:
    version: ^0.0.1 # パッケージのバージョンを指定
```

その後、`dart pub get` を実行してください。

## 使用方法

### 1. analysis_options.yaml の設定

プロジェクトの `analysis_options.yaml` に以下の設定を追加してください：

```yaml
include: package:flutter_lints/flutter.yaml

plugins:
  restrict_raw_flutter:
    version: ^0.0.1
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
      ban_colors: true
      ban_color: true
```

### 2. 解析の実行

標準の `dart analyze` または `flutter analyze` コマンドを実行してください：

```bash
dart analyze
```

または

```bash
flutter analyze
```

### 3. 警告の確認

標準Widgetを使用している箇所で警告が表示されます：

```
info • Usage of Text widget is prohibited • lib/main.dart:86:16 • ban_text_widget
info • Usage of Container widget is prohibited • lib/main.dart:42:8 • ban_container_widget
```

## 特定の箇所で警告を抑制する

どうしても標準Widgetを使用する必要がある場合は、ignoreコメントを使用できます：

```dart
// ignore: restrict_raw_flutter/ban_text_widget
Text('This is allowed');
```

## 参考リンク

- [Dart公式ドキュメント - Analyzer plugins](https://dart.dev/tools/analyzer-plugins)
- [analysis_server_plugin パッケージ](https://pub.dev/packages/analysis_server_plugin)
- [Qiita記事 - Dart3.10系からの新機能、Analyzer pluginsでlintルール実装してみた](https://qiita.com/SotaAtos/items/b5eed87dc3311864ce16)

## ライセンス

このパッケージのライセンス情報については、LICENSEファイルを参照してください。
