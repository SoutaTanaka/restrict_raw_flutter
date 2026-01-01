import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:restrict_raw_flutter/src/rules/ban_listview_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

@reflectiveTest
class BanListViewRuleTest extends AnalysisRuleTest {
  @override
  void setUp() {
    newPackage('flutter')
      ..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class ListView extends StatelessWidget {}
class GridView extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanListViewRule();
    super.setUp();
  }

  void test_hasListView() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  ListView();
}
''',
      [lint(57, 10)],
    );
  }

  void test_noListView() async {
    await assertNoDiagnostics(r'''
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
      ..addFile('lib/material.dart', r'''
export 'package:flutter/widgets.dart';
''')
      ..addFile('lib/widgets.dart', r'''
class Widget {}
class StatelessWidget extends Widget {}
class ListView extends StatelessWidget {}
class GridView extends StatelessWidget {}
class Container extends StatelessWidget {}
''');
    rule = BanGridViewRule();
    super.setUp();
  }

  void test_hasGridView() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/material.dart';

void main() {
  GridView();
}
''',
      [lint(57, 10)],
    );
  }

  void test_noGridView() async {
    await assertNoDiagnostics(r'''
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
