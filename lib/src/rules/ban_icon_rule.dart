import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's Icon widget.
class BanIconRule extends WidgetBanRuleBase {
  /// Creates a new [BanIconRule] instance.
  BanIconRule()
    : super(
        ruleName: 'ban_icon_widget',
        widgetName: 'Icon',
        errorMessage: 'Usage of Icon widget is prohibited.',
        correctionMessage:
            'Use a custom icon widget from your design system instead.',
        description:
            'Icon widget is prohibited. Use a custom icon widget instead.',
      );
}
