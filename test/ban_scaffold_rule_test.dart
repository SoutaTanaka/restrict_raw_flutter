import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_scaffold_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanScaffoldRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class Scaffold extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanScaffoldRule();
    super.setUp();
  }

  void test_hasScaffold() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  Scaffold();
}
''',
      [lint(57, 10)],
    );
  }

  void test_noScaffold() async {
    await assertNoDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''',
    );
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanScaffoldRuleTest);
  });
}

