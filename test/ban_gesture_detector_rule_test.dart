import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_gesture_detector_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanGestureDetectorRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class GestureDetector extends StatelessWidget {
  GestureDetector({Object? onTap});
}
class Container extends StatelessWidget {}
''');
    rule = BanGestureDetectorRule();
    super.setUp();
  }

  Future<void> test_hasGestureDetector() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  GestureDetector(onTap: () {});
}
''',
      [lint(57, 29)],
    );
  }

  Future<void> test_noGestureDetector() async {
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
    defineReflectiveTests(BanGestureDetectorRuleTest);
  });
}
