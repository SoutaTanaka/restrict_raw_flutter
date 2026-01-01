import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's InkWell widget.
class BanInkWellRule extends WidgetBanRuleBase {
  /// Creates a new [BanInkWellRule] instance.
  BanInkWellRule()
    : super(
        ruleName: 'ban_inkwell_widget',
        widgetName: 'InkWell',
        errorMessage: 'Usage of InkWell widget is prohibited.',
        correctionMessage:
            'Use a custom ink well widget from your design system instead.',
        description:
            'InkWell widget is prohibited. '
            'Use a custom ink well widget instead.',
      );
}
