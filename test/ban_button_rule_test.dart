import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_button_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanElevatedButtonRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class ElevatedButton extends StatelessWidget {
  ElevatedButton({Object? onPressed, Object? child});
}
class TextButton extends StatelessWidget {
  TextButton({Object? onPressed, Object? child});
}
class OutlinedButton extends StatelessWidget {
  OutlinedButton({Object? onPressed, Object? child});
}
class Container extends StatelessWidget {}
class Text extends StatelessWidget {
  Text(String text);
}
''');
    rule = BanElevatedButtonRule();
    super.setUp();
  }

  void test_hasElevatedButton() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  ElevatedButton(onPressed: () {}, child: Text('Test'));
}
''',
      [lint(57, 53)],
    );
  }

  void test_noElevatedButton() async {
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

@reflectiveTest
class BanTextButtonRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class ElevatedButton extends StatelessWidget {
  ElevatedButton({Object? onPressed, Object? child});
}
class TextButton extends StatelessWidget {
  TextButton({Object? onPressed, Object? child});
}
class OutlinedButton extends StatelessWidget {
  OutlinedButton({Object? onPressed, Object? child});
}
class Container extends StatelessWidget {}
class Text extends StatelessWidget {
  Text(String text);
}
''');
    rule = BanTextButtonRule();
    super.setUp();
  }

  void test_hasTextButton() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  TextButton(onPressed: () {}, child: Text('Test'));
}
''',
      [lint(57, 49)],
    );
  }

  void test_noTextButton() async {
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

@reflectiveTest
class BanOutlinedButtonRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class ElevatedButton extends StatelessWidget {
  ElevatedButton({Object? onPressed, Object? child});
}
class TextButton extends StatelessWidget {
  TextButton({Object? onPressed, Object? child});
}
class OutlinedButton extends StatelessWidget {
  OutlinedButton({Object? onPressed, Object? child});
}
class Container extends StatelessWidget {}
class Text extends StatelessWidget {
  Text(String text);
}
''');
    rule = BanOutlinedButtonRule();
    super.setUp();
  }

  void test_hasOutlinedButton() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  OutlinedButton(onPressed: () {}, child: Text('Test'));
}
''',
      [lint(57, 53)],
    );
  }

  void test_noOutlinedButton() async {
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
    defineReflectiveTests(BanElevatedButtonRuleTest);
    defineReflectiveTests(BanTextButtonRuleTest);
    defineReflectiveTests(BanOutlinedButtonRuleTest);
  });
}

