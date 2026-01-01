import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';
import 'package:restrict_raw_flutter/src/rules/ban_appbar_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_button_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_card_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_color_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_colors_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_container_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_gesture_detector_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_icon_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_image_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_inkwell_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_listview_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_scaffold_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_text_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_textfield_rule.dart';

/// This variable name must be "plugin"
final plugin = RestrictRawFlutterPlugin();

/// Plugin to restrict usage of Flutter's standard widgets.
///
/// Encourages using custom design system components instead of raw widgets.
class RestrictRawFlutterPlugin extends Plugin {
  @override
  String get name => 'restrict_raw_flutter';

  @override
  void register(PluginRegistry registry) {
    // Register all rules
    registry
      ..registerLintRule(BanTextRule())
      ..registerLintRule(BanContainerRule())
      ..registerLintRule(BanElevatedButtonRule())
      ..registerLintRule(BanTextButtonRule())
      ..registerLintRule(BanOutlinedButtonRule())
      ..registerLintRule(BanIconRule())
      ..registerLintRule(BanImageRule())
      ..registerLintRule(BanScaffoldRule())
      ..registerLintRule(BanAppBarRule())
      ..registerLintRule(BanListViewRule())
      ..registerLintRule(BanGridViewRule())
      ..registerLintRule(BanTextFieldRule())
      ..registerLintRule(BanTextFormFieldRule())
      ..registerLintRule(BanCardRule())
      ..registerLintRule(BanGestureDetectorRule())
      ..registerLintRule(BanInkWellRule())
      ..registerLintRule(BanColorsRule())
      ..registerLintRule(BanColorRule());
  }
}
