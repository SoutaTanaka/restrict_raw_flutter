import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_icon_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanIconRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
class Icons {
  static const add = null;
}
''')..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class Icon extends StatelessWidget {
  Icon(Object icon);
}
class Container extends StatelessWidget {}
''');
    rule = BanIconRule();
    super.setUp();
  }

  void test_hasIcon() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  Icon(Icons.add);
}
''',
      [lint(57, 15)],
    );
  }

  void test_noIcon() async {
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
    defineReflectiveTests(BanIconRuleTest);
  });
}

