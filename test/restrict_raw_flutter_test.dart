import 'package:test/test.dart';

import 'ban_appbar_rule_test.dart' as ban_appbar_rule_test;
import 'ban_button_rule_test.dart' as ban_button_rule_test;
import 'ban_card_rule_test.dart' as ban_card_rule_test;
import 'ban_container_rule_test.dart' as ban_container_rule_test;
import 'ban_gesture_detector_rule_test.dart' as ban_gesture_detector_rule_test;
import 'ban_icon_rule_test.dart' as ban_icon_rule_test;
import 'ban_image_rule_test.dart' as ban_image_rule_test;
import 'ban_inkwell_rule_test.dart' as ban_inkwell_rule_test;
import 'ban_listview_rule_test.dart' as ban_listview_rule_test;
import 'ban_scaffold_rule_test.dart' as ban_scaffold_rule_test;
// Import all rule tests
import 'ban_text_rule_test.dart' as ban_text_rule_test;
import 'ban_textfield_rule_test.dart' as ban_textfield_rule_test;
import 'plugin_test.dart' as plugin_test;

void main() {
  group('restrict_raw_flutter', () {
    // Run each test suite
    ban_text_rule_test.main();
    ban_container_rule_test.main();
    ban_button_rule_test.main();
    ban_icon_rule_test.main();
    ban_image_rule_test.main();
    ban_scaffold_rule_test.main();
    ban_appbar_rule_test.main();
    ban_listview_rule_test.main();
    ban_textfield_rule_test.main();
    ban_card_rule_test.main();
    ban_gesture_detector_rule_test.main();
    ban_inkwell_rule_test.main();
    plugin_test.main();
  });
}
