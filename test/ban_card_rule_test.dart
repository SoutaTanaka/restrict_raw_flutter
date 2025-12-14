import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_card_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanCardRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class Card extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanCardRule();
    super.setUp();
  }

  void test_hasCard() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  Card();
}
''',
      [lint(57, 6)],
    );
  }

  void test_noCard() async {
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
    defineReflectiveTests(BanCardRuleTest);
  });
}

