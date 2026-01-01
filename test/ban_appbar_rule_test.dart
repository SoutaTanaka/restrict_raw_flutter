import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_appbar_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanAppBarRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class AppBar extends StatelessWidget {
  AppBar({Object? title});
}
class Scaffold extends StatelessWidget {
  Scaffold({Object? appBar});
}
class Container extends StatelessWidget {}
class Text extends StatelessWidget {
  Text(String text);
}
''');
    rule = BanAppBarRule();
    super.setUp();
  }

  Future<void> test_hasAppBar() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  AppBar();
}
''',
      [lint(57, 8)],
    );
  }

  Future<void> test_noAppBar() async {
    await assertNoDiagnostics('''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''');
  }

  Future<void> test_appBarInScaffold() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
    );
  }
}
''',
      [lint(150, 27)],
    );
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanAppBarRuleTest);
  });
}
