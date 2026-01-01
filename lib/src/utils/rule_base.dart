import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/error/error.dart';

import 'package:restrict_raw_flutter/src/utils/widget_visitor.dart';

/// Base class for widget ban rules
///
/// Provides common logic, and each rule extends this class to implement.
abstract class WidgetBanRuleBase extends AnalysisRule {
  /// Creates a new [WidgetBanRuleBase] instance.
  WidgetBanRuleBase({
    required this.ruleName,
    required this.widgetName,
    required this.errorMessage,
    required this.correctionMessage,
    required super.description,
  }) : super(name: ruleName);

  /// Rule name
  final String ruleName;

  /// Widget name
  final String widgetName;

  /// Error message
  final String errorMessage;

  /// Correction message
  final String correctionMessage;

  @override
  LintCode get diagnosticCode =>
      LintCode(ruleName, errorMessage, correctionMessage: correctionMessage);

  @override
  void registerNodeProcessors(
    RuleVisitorRegistry registry,
    RuleContext context,
  ) {
    registry.addInstanceCreationExpression(
      this,
      WidgetBanVisitor(this, widgetName),
    );
  }
}
