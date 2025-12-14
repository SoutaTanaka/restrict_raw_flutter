import '../utils/rule_base.dart';

class BanCardRule extends WidgetBanRuleBase {
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

