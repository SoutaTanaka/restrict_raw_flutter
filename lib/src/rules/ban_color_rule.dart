import '../utils/rule_base.dart';

class BanColorRule extends WidgetBanRuleBase {
  BanColorRule()
      : super(
          ruleName: 'ban_color',
          widgetName: 'Color',
          errorMessage: 'Usage of Color constructor is prohibited.',
          correctionMessage:
              'Use custom color definitions from your design system instead.',
          description:
              'Color constructor is prohibited. Use custom color definitions instead.',
        );
}

