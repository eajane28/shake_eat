import 'package:flutter_test/flutter_test.dart';
import 'package:food_frenzy/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PageViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
