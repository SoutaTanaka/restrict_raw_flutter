import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's Scaffold widget.
class BanScaffoldRule extends WidgetBanRuleBase {
  /// Creates a new [BanScaffoldRule] instance.
  BanScaffoldRule()
    : super(
        ruleName: 'ban_scaffold_widget',
        widgetName: 'Scaffold',
        errorMessage: 'Usage of Scaffold widget is prohibited.',
        correctionMessage:
            'Use a custom scaffold widget from your design system instead.',
        description:
            'Scaffold widget is prohibited. '
            'Use a custom scaffold widget instead.',
      );
}
