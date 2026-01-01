import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's ElevatedButton widget.
class BanElevatedButtonRule extends WidgetBanRuleBase {
  /// Creates a new [BanElevatedButtonRule] instance.
  BanElevatedButtonRule()
    : super(
        ruleName: 'ban_elevated_button_widget',
        widgetName: 'ElevatedButton',
        errorMessage: 'Usage of ElevatedButton widget is prohibited.',
        correctionMessage:
            'Use a custom button widget from your design system instead.',
        description:
            'ElevatedButton widget is prohibited. '
            'Use a custom button widget instead.',
      );
}

/// Rule to ban usage of Flutter's TextButton widget.
class BanTextButtonRule extends WidgetBanRuleBase {
  /// Creates a new [BanTextButtonRule] instance.
  BanTextButtonRule()
    : super(
        ruleName: 'ban_text_button_widget',
        widgetName: 'TextButton',
        errorMessage: 'Usage of TextButton widget is prohibited.',
        correctionMessage:
            'Use a custom button widget from your design system instead.',
        description:
            'TextButton widget is prohibited. '
            'Use a custom button widget instead.',
      );
}

/// Rule to ban usage of Flutter's OutlinedButton widget.
class BanOutlinedButtonRule extends WidgetBanRuleBase {
  /// Creates a new [BanOutlinedButtonRule] instance.
  BanOutlinedButtonRule()
    : super(
        ruleName: 'ban_outlined_button_widget',
        widgetName: 'OutlinedButton',
        errorMessage: 'Usage of OutlinedButton widget is prohibited.',
        correctionMessage:
            'Use a custom button widget from your design system instead.',
        description:
            'OutlinedButton widget is prohibited. '
            'Use a custom button widget instead.',
      );
}
