import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's GestureDetector widget.
class BanGestureDetectorRule extends WidgetBanRuleBase {
  /// Creates a new [BanGestureDetectorRule] instance.
  BanGestureDetectorRule()
    : super(
        ruleName: 'ban_gesture_detector_widget',
        widgetName: 'GestureDetector',
        errorMessage: 'Usage of GestureDetector widget is prohibited.',
        correctionMessage:
            'Use a custom gesture detector widget '
            'from your design system instead.',
        description:
            'GestureDetector widget is prohibited. '
            'Use a custom gesture detector widget instead.',
      );
}
