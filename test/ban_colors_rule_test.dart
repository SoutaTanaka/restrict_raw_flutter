import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_colors_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanColorsRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';

class Colors {
  static const red = Color(0xFFFF0000);
  static const blue = Color(0xFF0000FF);
  static const green = Color(0xFF00FF00);
}

class Color {
  const Color(int value);
}
''')
      ..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class Container extends StatelessWidget {
  Container({Object? color});
}
''');
    rule = BanColorsRule();
    super.setUp();
  }

  void test_hasColorsRed() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  var color = Colors.red;
}
''',
      [lint(69, 10)],
    );
  }

  void test_hasColorsBlue() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  var color = Colors.blue;
}
''',
      [lint(69, 11)],
    );
  }

  void test_colorsInWidget() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  Widget build(Object context) {
    return Container(color: Colors.red);
  }
}
''',
      [lint(143, 10)],
    );
  }

  void test_noColors() async {
    await assertNoDiagnostics(
      r'''
import 'package:flutter/material.dart';

const myRed = Color(0xFFFF0000);

void main() {
  var color = myRed;
}
''',
    );
  }

  void test_customColorsClass() async {
    await assertNoDiagnostics(
      r'''
import 'package:flutter/material.dart';

class MyColors {
  static const red = Color(0xFFFF0000);
}

void main() {
  var color = MyColors.red;
}
''',
    );
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanColorsRuleTest);
  });
}

