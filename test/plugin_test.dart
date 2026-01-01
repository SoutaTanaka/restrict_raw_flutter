import 'package:restrict_raw_flutter/main.dart';
import 'package:test/test.dart';

void main() {
  group('RestrictRawFlutterPlugin', () {
    test('should instantiate correctly', () {
      expect(plugin, isNotNull);
      expect(plugin, isA<RestrictRawFlutterPlugin>());
    });

    test('should have correct plugin name', () {
      expect(plugin.name, equals('restrict_raw_flutter'));
    });

    test('should export plugin as plugin variable', () {
      // Verify that plugin variable exists and has correct type
      expect(plugin, isA<RestrictRawFlutterPlugin>());
    });
  });
}
