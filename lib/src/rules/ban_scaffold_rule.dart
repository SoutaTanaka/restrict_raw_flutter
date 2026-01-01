import '../utils/rule_base.dart';

class BanScaffoldRule extends WidgetBanRuleBase {
  BanScaffoldRule()
    : super(
        ruleName: 'ban_scaffold_widget',
        widgetName: 'Scaffold',
        errorMessage: 'Usage of Scaffold widget is prohibited.',
        correctionMessage:
            'Use a custom scaffold widget from your design system instead.',
        description:
            'Scaffold widget is prohibited. Use a custom scaffold widget instead.',
      );
}
