import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart';

/// Rule to ban usage of Flutter's Color constructor.
class BanColorRule extends AnalysisRule {
  /// Creates a new [BanColorRule] instance.
  BanColorRule()
    : super(
        name: 'ban_color',
        description:
            'Color constructor is prohibited. '
            'Use custom color definitions instead.',
      );

  @override
  LintCode get diagnosticCode => const LintCode(
    'ban_color',
    'Usage of Color constructor is prohibited.',
    correctionMessage:
        'Use custom color definitions from your design system instead.',
  );

  @override
  void registerNodeProcessors(
    RuleVisitorRegistry registry,
    RuleContext context,
  ) {
    final visitor = _BanColorVisitor(this);
    registry
      ..addInstanceCreationExpression(this, visitor)
      ..addMethodInvocation(this, visitor);
  }
}

class _BanColorVisitor extends SimpleAstVisitor<void> {
  _BanColorVisitor(this.rule);
  final AnalysisRule rule;

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    _checkColorUsage(node.staticType, node);
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    // Check if it's a Color constructor call (Color(...) or Color.fromXXX(...))
    final target = node.target;

    // For Color(...) - target is null and methodName is 'Color'
    if (target == null && node.methodName.name == 'Color') {
      final type = node.staticType;
      _checkColorUsage(type, node);
      return;
    }

    // For Color.fromARGB(...) etc - target is SimpleIdentifier 'Color'
    if (target is SimpleIdentifier && target.name == 'Color') {
      final type = target.staticType;
      _checkColorUsage(type, node);
      return;
    }
  }

  void _checkColorUsage(DartType? type, AstNode node) {
    if (type == null) return;

    final element = type.element;

    if (element is ClassElement && element.name == 'Color') {
      final libraryUri = element.library.identifier;
      // Color is in dart:ui, which is part of Flutter
      if (libraryUri.startsWith('package:flutter/') ||
          libraryUri.startsWith('dart:ui')) {
        rule.reportAtNode(node);
      }
    }
  }
}
