import '../utils/rule_base.dart';

class BanGestureDetectorRule extends WidgetBanRuleBase {
  BanGestureDetectorRule()
    : super(
        ruleName: 'ban_gesture_detector_widget',
        widgetName: 'GestureDetector',
        errorMessage: 'Usage of GestureDetector widget is prohibited.',
        correctionMessage:
            'Use a custom gesture detector widget from your design system instead.',
        description:
            'GestureDetector widget is prohibited. Use a custom gesture detector widget instead.',
      );
}
