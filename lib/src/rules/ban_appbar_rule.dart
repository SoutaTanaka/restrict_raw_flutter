import '../utils/rule_base.dart';

class BanAppBarRule extends WidgetBanRuleBase {
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
