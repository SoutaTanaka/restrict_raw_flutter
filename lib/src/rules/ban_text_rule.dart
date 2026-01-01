import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's Text widget.
class BanTextRule extends WidgetBanRuleBase {
  /// Creates a new [BanTextRule] instance.
  BanTextRule()
    : super(
        ruleName: 'ban_text_widget',
        widgetName: 'Text',
        errorMessage: 'Usage of Text widget is prohibited.',
        correctionMessage:
            'Use a custom text widget from your design system instead.',
        description:
            'Text widget is prohibited. Use a custom text widget instead.',
      );
}
