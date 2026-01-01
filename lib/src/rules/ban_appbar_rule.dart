import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's AppBar widget.
class BanAppBarRule extends WidgetBanRuleBase {
  /// Creates a new [BanAppBarRule] instance.
  BanAppBarRule()
    : super(
        ruleName: 'ban_appbar_widget',
        widgetName: 'AppBar',
        errorMessage: 'Usage of AppBar widget is prohibited.',
        correctionMessage:
            'Use a custom app bar widget from your design system instead.',
        description:
            'AppBar widget is prohibited. Use a custom app bar widget instead.',
      );
}
