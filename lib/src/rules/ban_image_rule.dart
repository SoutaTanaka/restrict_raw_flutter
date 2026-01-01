import '../utils/rule_base.dart';

class BanImageRule extends WidgetBanRuleBase {
  BanImageRule()
    : super(
        ruleName: 'ban_image_widget',
        widgetName: 'Image',
        errorMessage: 'Usage of Image widget is prohibited.',
        correctionMessage:
            'Use a custom image widget from your design system instead.',
        description:
            'Image widget is prohibited. Use a custom image widget instead.',
      );
}
