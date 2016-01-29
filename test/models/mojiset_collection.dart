library smairu_test.models.mojiset_collection;

import 'package:test/test.dart' show test, group, expect, equals;
import 'package:smairu/models.dart' show Mojiset, MojisetCollection;

final mock = [
    {
        'category': 'Happiness',
        'data': ['(*^ω^)', '(´∀｀*)', '(-‿‿-)']
    },
    {
        'category': 'Sadness',
        'data': ['( ╥ω╥ )', '(个_个)', '(>_<)']
    }
];

void testMojisetCollection() {
    group('MojisetCollection', () {
        test('.from() constructs MojisetCollection from list of Map objects',
            testMojisetCollection_from);
        test('.current gets the Mojiset object that inner cursor is pointing at',
            testMojisetCollection_current);
        test('.first gets the first Mojiset object in collection',
            testMojisetCollection_first);
        test('.last gets the last Mojiset object in collection',
            testMojisetCollection_last);
        test('.add() adds new Mojiset object to collection',
            testMojisetCollection_add);
        test('.remove() removes specified Mojiset object from collection',
            testMojisetCollection_remove);
        test('.removeAt() removes Mojiset object at specified index from collection',
            testMojisetCollection_removeAt);
    });
}

void testMojisetCollection_from() {
    var collection = new MojisetCollection.from(mock);
    
    expect(collection[0].category, equals('Happiness'));
    expect(collection[1].asList(), equals(['( ╥ω╥ )', '(个_个)', '(>_<)']));
}

void testMojisetCollection_current() {
    var collection = new MojisetCollection.from(mock);

    expect(collection.current.category, equals('Happiness'));
    expect(collection.current.asList(), equals(['(*^ω^)', '(´∀｀*)', '(-‿‿-)']));
}

void testMojisetCollection_first() {
    var collection = new MojisetCollection.from(mock);

    expect(collection.first.category, equals('Happiness'));
    expect(collection.first.asList(), equals(['(*^ω^)', '(´∀｀*)', '(-‿‿-)']));
}

void testMojisetCollection_last() {
    var collection = new MojisetCollection.from(mock);

    expect(collection.last.category, equals('Sadness'));
    expect(collection.last.asList(), equals(['( ╥ω╥ )', '(个_个)', '(>_<)']));
}

void testMojisetCollection_add() {
    var collection = new MojisetCollection.from(mock);
    collection.add(new Mojiset.fromCategory('Custom'));
    
    expect(collection.last.category, equals('Custom'));
}

void testMojisetCollection_removeAt() {
    var collection = new MojisetCollection.from(mock);
    collection.removeAt(1);
    
    expect(collection.length, equals(1));
}

void testMojisetCollection_remove() {
    var collection = new MojisetCollection.from(mock);
    var el = new Mojiset.from(mock[0]);
    print(collection[0] == el);
    collection.remove(new Mojiset.from(mock[0]));
    
    expect(collection.length, equals(1));
    expect(collection.first.category, equals('Sadness'));
}

void testMojisetCollection_toList() {
    var collection = new MojisetCollection.from(mock);

    expect(collection.toList(), equals([
        new Mojiset.from(mock[0]),
        new Mojiset.from(mock[1])
    ]));
}
