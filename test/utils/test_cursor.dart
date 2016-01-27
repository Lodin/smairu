part of smairu_test.utils;

void testCursor() {
    group('Cursor', () {
        test('.current returns the current position of cursor',
            testCursor_current);
        test('.move() moves the cursor to some position',
            testCursor_move);
        test('.nextExists return true if the cursor can be moved forward',
            testCursor_nextExists);
        test('.previousExists return true if the cursor can be moved backward', 
            testCursor_previousExists);
        test('.next() moves cursor forward one position',
            testCursor_next);
        test('.previous() moves cursor backward one position',
            testCursor_previous);
    });
}

void testCursor_current() {
    var cursor = new Cursor(10);

    expect(cursor.current, equals(0));
}

void testCursor_move() {
    var cursor = new Cursor(10);
    cursor.move(3);

    expect(cursor.current, equals(3));
    expect(tryError((){ cursor.move(11); }), isNotNull);
}

void testCursor_nextExists() {
    var cursor = new Cursor(10);

    expect(cursor.nextExists, equals(true));

    cursor.move(9);
    expect(cursor.nextExists, equals(false));
}

void testCursor_previousExists() {
    var cursor = new Cursor(10);

    expect(cursor.previousExists, equals(false));

    cursor.move(9);
    expect(cursor.previousExists, equals(true));
}

void testCursor_next() {
    var cursor = new Cursor(10);
    cursor.next();

    expect(cursor.current, equals(1));
}

void testCursor_previous() {
    var cursor = new Cursor(10);
    cursor.next();
    cursor.previous();

    expect(cursor.current, equals(0));
}
