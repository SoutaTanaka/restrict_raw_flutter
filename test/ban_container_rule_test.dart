import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_container_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanContainerRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class Container extends StatelessWidget {}
class SizedBox extends StatelessWidget {}
''');
    rule = BanContainerRule();
    super.setUp();
  }

  Future<void> test_hasContainer() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''',
      [lint(57, 11)],
    );
  }

  Future<void> test_noContainer() async {
    await assertNoDiagnostics('''
import 'package:flutter/material.dart';

void main() {
  SizedBox();
}
''');
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanContainerRuleTest);
  });
}
