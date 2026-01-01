import '../utils/rule_base.dart';

class BanIconRule extends WidgetBanRuleBase {
  BanIconRule()
    : super(
        ruleName: 'ban_icon_widget',
        widgetName: 'Icon',
        errorMessage: 'Usage of Icon widget is prohibited.',
        correctionMessage:
            'Use a custom icon widget from your design system instead.',
        description:
            'Icon widget is prohibited. Use a custom icon widget instead.',
      );
}
