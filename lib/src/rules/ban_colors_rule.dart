import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart';

/// Rule to ban usage of Flutter's Colors class
class BanColorsRule extends AnalysisRule {
  BanColorsRule()
      : super(
          name: 'ban_colors',
          description:
              'Usage of Colors class is prohibited. Use custom color definitions from your design system instead.',
        );

  @override
  LintCode get diagnosticCode => LintCode(
        'ban_colors',
        'Usage of Colors class is prohibited.',
        correctionMessage:
            'Use custom color definitions from your design system instead.',
      );

  @override
  void registerNodeProcessors(
    RuleVisitorRegistry registry,
    RuleContext context,
  ) {
    final visitor = _BanColorsVisitor(this, context);
    registry.addPrefixedIdentifier(this, visitor);
    registry.addPropertyAccess(this, visitor);
  }
}

class _BanColorsVisitor extends SimpleAstVisitor<void> {
  final AnalysisRule rule;
  final RuleContext context;

  _BanColorsVisitor(this.rule, this.context);

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    _checkColorsUsage(node.prefix, node);
  }

  @override
  void visitPropertyAccess(PropertyAccess node) {
    final target = node.target;
    if (target is SimpleIdentifier) {
      _checkColorsUsage(target, node);
    }
  }

  void _checkColorsUsage(SimpleIdentifier identifier, AstNode node) {
    // Check if the identifier name is 'Colors'
    if (identifier.name != 'Colors') return;
    
    // Check if it's from Flutter by examining the compilation unit's imports
    final compilationUnit = node.thisOrAncestorOfType<CompilationUnit>();
    if (compilationUnit == null) return;
    
    // Check if any import is from Flutter
    for (final directive in compilationUnit.directives) {
      if (directive is ImportDirective) {
        final uriContent = directive.uri.stringValue;
        if (uriContent != null && uriContent.startsWith('package:flutter/')) {
          rule.reportAtNode(node);
          return;
        }
      }
    }
  }
}

