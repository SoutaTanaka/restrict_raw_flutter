import '../utils/rule_base.dart';

class BanTextFieldRule extends WidgetBanRuleBase {
  BanTextFieldRule()
      : super(
          ruleName: 'ban_textfield_widget',
          widgetName: 'TextField',
          errorMessage: 'Usage of TextField widget is prohibited.',
          correctionMessage:
              'Use a custom text field widget from your design system instead.',
          description:
              'TextField widget is prohibited. Use a custom text field widget instead.',
        );
}

class BanTextFormFieldRule extends WidgetBanRuleBase {
  BanTextFormFieldRule()
      : super(
          ruleName: 'ban_textformfield_widget',
          widgetName: 'TextFormField',
          errorMessage: 'Usage of TextFormField widget is prohibited.',
          correctionMessage:
              'Use a custom text form field widget from your design system instead.',
          description:
              'TextFormField widget is prohibited. Use a custom text form field widget instead.',
        );
}

