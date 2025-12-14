import '../utils/rule_base.dart';

class BanContainerRule extends WidgetBanRuleBase {
  BanContainerRule()
      : super(
          ruleName: 'ban_container_widget',
          widgetName: 'Container',
          errorMessage: 'Usage of Container widget is prohibited.',
          correctionMessage:
              'Use a custom container widget from your design system instead.',
          description:
              'Container widget is prohibited. Use a custom container widget instead.',
        );
}

