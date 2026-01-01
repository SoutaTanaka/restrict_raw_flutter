/// An analyzer plugin package to restrict usage of Flutter's standard widgets
///
/// This package detects and warns about the usage of Flutter's standard widgets
/// to encourage the use of custom design system components.
library;

// The analyzer plugin entry point is in lib/main.dart

// Export rules for testing purposes
export 'src/rules/ban_text_rule.dart';
export 'src/rules/ban_container_rule.dart';
export 'src/rules/ban_button_rule.dart';
export 'src/rules/ban_icon_rule.dart';
export 'src/rules/ban_image_rule.dart';
export 'src/rules/ban_scaffold_rule.dart';
export 'src/rules/ban_appbar_rule.dart';
export 'src/rules/ban_listview_rule.dart';
export 'src/rules/ban_textfield_rule.dart';
export 'src/rules/ban_card_rule.dart';
export 'src/rules/ban_gesture_detector_rule.dart';
export 'src/rules/ban_inkwell_rule.dart';
export 'src/rules/ban_colors_rule.dart';
export 'src/rules/ban_color_rule.dart';
