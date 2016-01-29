library smairu_test.models.mojiset;

import 'package:test/test.dart' show test, group, expect, equals;
import 'package:smairu/models.dart' show Mojiset;

final mock = {
    'category': 'Happiness',
    'data': ['(*^ω^)', '(´∀｀*)', '(-‿‿-)']
};

void testMojiset() {
    group('Mojiset', () {
        test('.from() constructs Mojiset from existed Map object',
            testMojiset_from);
        test('.fromCategory() constructs Mojiset from category name', 
            testMojiset_fromCategory);
        test('.add() adds one string (or null) element to Mojiset',
            testMojiset_add);
        test('.remove() removes one element from Mojiset by value',
            testMojiset_remove);
        test('.removeAt() removes one element from Mojiset by index',
            testMojiset_removeAt);
        test('[i] returns element with index `i`', 
           testMojiset_operatorIndex);
    });
}

void testMojiset_from() {
    var set = new Mojiset.from(mock);

    expect(set.category, equals('Happiness'));
    expect(set.asList(), equals(['(*^ω^)', '(´∀｀*)', '(-‿‿-)']));
}

void testMojiset_fromCategory() {
    var set = new Mojiset.fromCategory('Custom');

    expect(set.category, equals('Custom'));
    expect(set.isEmpty, equals(true));
}

void testMojiset_add() {
    var set = new Mojiset.from(mock);
    set.add();

    expect(set.asList(), equals(['(*^ω^)', '(´∀｀*)', '(-‿‿-)', null]));
}

void testMojiset_remove() {
    var set = new Mojiset.from(mock);
    set.add();
    set.remove('(-‿‿-)');

    expect(set.asList(), equals(['(*^ω^)', '(´∀｀*)', null]));
}

void testMojiset_removeAt() {
    var set = new Mojiset.from(mock);
    set.add();
    set.removeAt(2);

    expect(set.asList(), equals(['(*^ω^)', '(´∀｀*)', null]));
}

void testMojiset_operatorIndex() {
    var set = new Mojiset.from(mock);
    set.add();
    set[3] = '(◕‿◕)';

    expect(set.asList(), equals(['(*^ω^)', '(´∀｀*)', '(-‿‿-)', '(◕‿◕)']));
}
