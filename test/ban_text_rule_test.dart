import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_text_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanTextRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class Text extends StatelessWidget {
  Text(String text);
}
class Container extends StatelessWidget {}
''');
    rule = BanTextRule();
    super.setUp();
  }

  Future<void> test_hasText() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  Text('Hello');
}
''',
      [lint(57, 13)],
    );
  }

  Future<void> test_noText() async {
    await assertNoDiagnostics('''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''');
  }

  Future<void> test_textInWidget() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  Widget build(Object context) {
    return Text('Hello');
  }
}
''',
      [lint(126, 13)],
    );
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanTextRuleTest);
  });
}
