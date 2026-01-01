import '../utils/rule_base.dart';

class BanListViewRule extends WidgetBanRuleBase {
  BanListViewRule()
    : super(
        ruleName: 'ban_listview_widget',
        widgetName: 'ListView',
        errorMessage: 'Usage of ListView widget is prohibited.',
        correctionMessage:
            'Use a custom list view widget from your design system instead.',
        description:
            'ListView widget is prohibited. Use a custom list view widget instead.',
      );
}

class BanGridViewRule extends WidgetBanRuleBase {
  BanGridViewRule()
    : super(
        ruleName: 'ban_gridview_widget',
        widgetName: 'GridView',
        errorMessage: 'Usage of GridView widget is prohibited.',
        correctionMessage:
            'Use a custom grid view widget from your design system instead.',
        description:
            'GridView widget is prohibited. Use a custom grid view widget instead.',
      );
}
