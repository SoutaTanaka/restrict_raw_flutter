import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's TextField widget.
class BanTextFieldRule extends WidgetBanRuleBase {
  /// Creates a new [BanTextFieldRule] instance.
  BanTextFieldRule()
    : super(
        ruleName: 'ban_textfield_widget',
        widgetName: 'TextField',
        errorMessage: 'Usage of TextField widget is prohibited.',
        correctionMessage:
            'Use a custom text field widget from your design system instead.',
        description:
            'TextField widget is prohibited. '
            'Use a custom text field widget instead.',
      );
}

/// Rule to ban usage of Flutter's TextFormField widget.
class BanTextFormFieldRule extends WidgetBanRuleBase {
  /// Creates a new [BanTextFormFieldRule] instance.
  BanTextFormFieldRule()
    : super(
        ruleName: 'ban_textformfield_widget',
        widgetName: 'TextFormField',
        errorMessage: 'Usage of TextFormField widget is prohibited.',
        correctionMessage:
            'Use a custom text form field widget '
            'from your design system instead.',
        description:
            'TextFormField widget is prohibited. '
            'Use a custom text form field widget instead.',
      );
}
