library smairu_test.models;

import 'package:test/test.dart' show test, group, expect, equals;
import '../../lib/models.dart' show Mojiset, MojisetCollection;

import 'common/test_mojiset.dart';
import 'common/test_mojiset_collection.dart';

void testModels() {
    testMojiset();
    testMojisetCollection();
}
