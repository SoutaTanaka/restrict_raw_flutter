import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's Image widget.
class BanImageRule extends WidgetBanRuleBase {
  /// Creates a new [BanImageRule] instance.
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
