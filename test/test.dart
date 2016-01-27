#!/usr/bin/env dart

@TestOn("dart-vm")
library smairu_test;

import 'package:test/test.dart';
import 'models/test_models.dart' show testModels;
import 'utils/test_utils.dart' show testUtils;

void main() {
    testModels();
    testUtils();
}
