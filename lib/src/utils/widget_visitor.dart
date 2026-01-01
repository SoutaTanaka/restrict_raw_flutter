import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

/// A common visitor to detect usage of Flutter's standard widgets.
///
/// Monitors instance creation expressions and detects usage of
/// Flutter's standard widgets with the specified class name.
class WidgetBanVisitor extends SimpleAstVisitor<void> {
  /// Creates a new [WidgetBanVisitor] instance.
  WidgetBanVisitor(this.rule, this.widgetName);

  /// The analysis rule to report diagnostics.
  final AnalysisRule rule;

  /// The widget name to ban.
  final String widgetName;

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    final type = node.staticType;
    if (type == null) return;

    final element = type.element;

    if (element is ClassElement && element.name == widgetName) {
      final libraryUri = element.library.identifier;
      if (libraryUri.startsWith('package:flutter/')) {
        rule.reportAtNode(node);
      }
    }
  }
}
