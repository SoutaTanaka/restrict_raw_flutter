import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_color_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanColorRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';

class Color {
  const Color(int value);
  const Color.fromARGB(int a, int r, int g, int b);
  const Color.fromRGBO(int r, int g, int b, double opacity);
}

class Colors {
  static const red = Color(0xFFFF0000);
}
''')
      ..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class Container extends StatelessWidget {
  Container({Object? color});
}
''');
    rule = BanColorRule();
    super.setUp();
  }

  void test_hasColorConstructor() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  var color = Color(0xFF000000);
}
''',
      [lint(69, 17)],
    );
  }

  void test_hasColorFromARGB() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  var color = Color.fromARGB(255, 0, 0, 0);
}
''',
      [lint(69, 28)],
    );
  }

  void test_hasColorFromRGBO() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  var color = Color.fromRGBO(0, 0, 0, 1.0);
}
''',
      [lint(69, 28)],
    );
  }

  void test_colorInWidget() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  Widget build(Object context) {
    return Container(color: Color(0xFFFFFFFF));
  }
}
''',
      [lint(143, 17)],
    );
  }

  void test_noColor() async {
    await assertNoDiagnostics(
      r'''
const myColor = 0xFF000000;

void main() {
  var color = myColor;
}
''',
    );
  }

  void test_customColorClass() async {
    await assertNoDiagnostics(
      r'''
class MyColor {
  const MyColor(int value);
}

void main() {
  var color = MyColor(0xFF000000);
}
''',
    );
  }

  void test_colorsClassNotBanned() async {
    await assertNoDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  var color = Colors.red;
}
''',
    );
  }
}

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(BanColorRuleTest);
  });
}

