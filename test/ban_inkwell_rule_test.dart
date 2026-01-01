import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_inkwell_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanInkWellRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class InkWell extends StatelessWidget {
  InkWell({Object? onTap});
}
class Container extends StatelessWidget {}
''');
    rule = BanInkWellRule();
    super.setUp();
  }

  void test_hasInkWell() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  InkWell(onTap: () {});
}
''',
      [lint(57, 21)],
    );
  }

  void test_noInkWell() async {
    await assertNoDiagnostics(r'''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''');
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanInkWellRuleTest);
  });
}
