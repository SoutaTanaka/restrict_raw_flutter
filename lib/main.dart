import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';

import 'src/rules/ban_text_rule.dart';
import 'src/rules/ban_container_rule.dart';
import 'src/rules/ban_button_rule.dart';
import 'src/rules/ban_icon_rule.dart';
import 'src/rules/ban_image_rule.dart';
import 'src/rules/ban_scaffold_rule.dart';
import 'src/rules/ban_appbar_rule.dart';
import 'src/rules/ban_listview_rule.dart';
import 'src/rules/ban_textfield_rule.dart';
import 'src/rules/ban_card_rule.dart';
import 'src/rules/ban_gesture_detector_rule.dart';
import 'src/rules/ban_inkwell_rule.dart';
import 'src/rules/ban_colors_rule.dart';

// This variable name must be "plugin"
final plugin = RestrictRawFlutterPlugin();

class RestrictRawFlutterPlugin extends Plugin {
  @override
  String get name => 'restrict_raw_flutter';

  @override
  void register(PluginRegistry registry) {
    // Register all rules
    registry.registerLintRule(BanTextRule());
    registry.registerLintRule(BanContainerRule());
    registry.registerLintRule(BanElevatedButtonRule());
    registry.registerLintRule(BanTextButtonRule());
    registry.registerLintRule(BanOutlinedButtonRule());
    registry.registerLintRule(BanIconRule());
    registry.registerLintRule(BanImageRule());
    registry.registerLintRule(BanScaffoldRule());
    registry.registerLintRule(BanAppBarRule());
    registry.registerLintRule(BanListViewRule());
    registry.registerLintRule(BanGridViewRule());
    registry.registerLintRule(BanTextFieldRule());
    registry.registerLintRule(BanTextFormFieldRule());
    registry.registerLintRule(BanCardRule());
    registry.registerLintRule(BanGestureDetectorRule());
    registry.registerLintRule(BanInkWellRule());
    registry.registerLintRule(BanColorsRule());
  }
}
