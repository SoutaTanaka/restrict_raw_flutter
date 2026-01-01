import 'package:restrict_raw_flutter/src/utils/rule_base.dart';

/// Rule to ban usage of Flutter's ListView widget.
class BanListViewRule extends WidgetBanRuleBase {
  /// Creates a new [BanListViewRule] instance.
  BanListViewRule()
    : super(
        ruleName: 'ban_listview_widget',
        widgetName: 'ListView',
        errorMessage: 'Usage of ListView widget is prohibited.',
        correctionMessage:
            'Use a custom list view widget from your design system instead.',
        description:
            'ListView widget is prohibited. '
            'Use a custom list view widget instead.',
      );
}

/// Rule to ban usage of Flutter's GridView widget.
class BanGridViewRule extends WidgetBanRuleBase {
  /// Creates a new [BanGridViewRule] instance.
  BanGridViewRule()
    : super(
        ruleName: 'ban_gridview_widget',
        widgetName: 'GridView',
        errorMessage: 'Usage of GridView widget is prohibited.',
        correctionMessage:
            'Use a custom grid view widget from your design system instead.',
        description:
            'GridView widget is prohibited. '
            'Use a custom grid view widget instead.',
      );
}
