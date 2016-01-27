library smairu_test.utils;

import 'package:test/test.dart' show test, group, expect, equals, isNotNull;
import '../../lib/utils.dart' show Cursor, SmairuException;
part 'test_cursor.dart';

SmairuException tryError(void callback()) {
    SmairuException expectedException;

    try {
        callback();
    }
    on SmairuException catch(ex) {
        expectedException = ex;
    }

    return expectedException;
}

void testUtils() {
    testCursor();
}


