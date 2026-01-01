import '../utils/rule_base.dart';

class BanElevatedButtonRule extends WidgetBanRuleBase {
  BanElevatedButtonRule()
    : super(
        ruleName: 'ban_elevated_button_widget',
        widgetName: 'ElevatedButton',
        errorMessage: 'Usage of ElevatedButton widget is prohibited.',
        correctionMessage:
            'Use a custom button widget from your design system instead.',
        description:
            'ElevatedButton widget is prohibited. Use a custom button widget instead.',
      );
}

class BanTextButtonRule extends WidgetBanRuleBase {
  BanTextButtonRule()
    : super(
        ruleName: 'ban_text_button_widget',
        widgetName: 'TextButton',
        errorMessage: 'Usage of TextButton widget is prohibited.',
        correctionMessage:
            'Use a custom button widget from your design system instead.',
        description:
            'TextButton widget is prohibited. Use a custom button widget instead.',
      );
}

class BanOutlinedButtonRule extends WidgetBanRuleBase {
  BanOutlinedButtonRule()
    : super(
        ruleName: 'ban_outlined_button_widget',
        widgetName: 'OutlinedButton',
        errorMessage: 'Usage of OutlinedButton widget is prohibited.',
        correctionMessage:
            'Use a custom button widget from your design system instead.',
        description:
            'OutlinedButton widget is prohibited. Use a custom button widget instead.',
      );
}
