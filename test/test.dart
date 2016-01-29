#!/usr/bin/env dart

@TestOn("dart-vm")
library smairu_test;

import 'package:test/test.dart';
import 'models.dart' show testModels;
import 'services.dart' show testServices;
import 'utils.dart' show testUtils;

void main() {
    testModels();
    testServices();
    testUtils();
}
