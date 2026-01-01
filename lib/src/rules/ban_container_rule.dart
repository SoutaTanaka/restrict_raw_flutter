import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's Container widget.
class BanContainerRule extends WidgetBanRuleBase {
  /// Creates a new [BanContainerRule] instance.
  BanContainerRule()
    : super(
        ruleName: 'ban_container_widget',
        widgetName: 'Container',
        errorMessage: 'Usage of Container widget is prohibited.',
        correctionMessage:
            'Use a custom container widget from your design system instead.',
        description:
            'Container widget is prohibited. '
            'Use a custom container widget instead.',
      );
}
