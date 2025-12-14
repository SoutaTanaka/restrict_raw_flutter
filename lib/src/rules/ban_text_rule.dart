import '../utils/rule_base.dart';

class BanTextRule extends WidgetBanRuleBase {
  BanTextRule()
      : super(
          ruleName: 'ban_text_widget',
          widgetName: 'Text',
          errorMessage: 'Usage of Text widget is prohibited.',
          correctionMessage:
              'Use a custom text widget from your design system instead.',
          description:
              'Text widget is prohibited. Use a custom text widget instead.',
        );
}

