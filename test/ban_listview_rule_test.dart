import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_listview_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanListViewRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class ListView extends StatelessWidget {}
class GridView extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanListViewRule();
    super.setUp();
  }

  Future<void> test_hasListView() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  ListView();
}
''',
      [lint(57, 10)],
    );
  }

  Future<void> test_noListView() async {
    await assertNoDiagnostics('''
import 'package:flutter/material.dart';

void main() {
  Container();
}
''');
  }
}

@reflectiveTest
class BanGridViewRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', '''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', '''
class Widget {}
class StatelessWidget extends Widget {}
class ListView extends StatelessWidget {}
class GridView extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanGridViewRule();
    super.setUp();
  }

  Future<void> test_hasGridView() async {
    await assertDiagnostics(
      '''
import 'package:flutter/material.dart';

void main() {
  GridView();
}
''',
      [lint(57, 10)],
    );
  }

  Future<void> test_noGridView() async {
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
    defineReflectiveTests(BanListViewRuleTest);
    defineReflectiveTests(BanGridViewRuleTest);
  });
}
