import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's Card widget.
class BanCardRule extends WidgetBanRuleBase {
  /// Creates a new [BanCardRule] instance.
  BanCardRule()
    : super(
        ruleName: 'ban_card_widget',
        widgetName: 'Card',
        errorMessage: 'Usage of Card widget is prohibited.',
        correctionMessage:
            'Use a custom card widget from your design system instead.',
        description:
            'Card widget is prohibited. Use a custom card widget instead.',
      );
}
