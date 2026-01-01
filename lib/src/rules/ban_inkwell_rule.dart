import '../utils/rule_base.dart';

class BanInkWellRule extends WidgetBanRuleBase {
  BanInkWellRule()
    : super(
        ruleName: 'ban_inkwell_widget',
        widgetName: 'InkWell',
        errorMessage: 'Usage of InkWell widget is prohibited.',
        correctionMessage:
            'Use a custom ink well widget from your design system instead.',
        description:
            'InkWell widget is prohibited. Use a custom ink well widget instead.',
      );
}
