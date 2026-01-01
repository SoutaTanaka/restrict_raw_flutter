import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_textfield_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanTextFieldRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class TextField extends StatelessWidget {}
class TextFormField extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanTextFieldRule();
    super.setUp();
  }

  Future<void> test_hasTextField() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  TextField();
}
''',
      [lint(57, 11)],
    );
  }

  Future<void> test_noTextField() async {
    await assertNoDiagnostics('''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''');
  }
}

@reflectiveTest
class BanTextFormFieldRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class TextField extends StatelessWidget {}
class TextFormField extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanTextFormFieldRule();
    super.setUp();
  }

  Future<void> test_hasTextFormField() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  TextFormField();
}
''',
      [lint(57, 15)],
    );
  }

  Future<void> test_noTextFormField() async {
    await assertNoDiagnostics('''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''');
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanTextFieldRuleTest);
    defineReflectiveTests(BanTextFormFieldRuleTest);
  });
}
