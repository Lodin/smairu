library smairu_test.services.app_data_service;

import 'package:test/test.dart' show test, group, expect, equals;
import 'package:smairu/models.dart' show MojisetCollection;
import 'package:smairu/services.dart' show AppDataService;

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

void testAppDataService() {
    group('AppDataService', (){
        test('.load() loads set of emoji and initializes AppDataService',
            testAppDataService_load);
        test('.select() selects set with specified category',
            testAppDataService_select);
        test('.isActive() tests if the specified category active or not',
            testAppDataService_isActive);
    });
}

void testAppDataService_load() {
    var service = new AppDataService()
        ..load(mock);

    expect(service.collection.toList(), equals(new MojisetCollection.from(mock).toList()));
    expect(service.categories, equals(['Happiness', 'Sadness']));
}

void testAppDataService_select() {
    var service = new AppDataService()
        ..load(mock);

    service.select('Sadness');

    expect(service.collection.current.category, equals('Sadness'));
}

void testAppDataService_isActive() {
    var service = new AppDataService()
        ..load(mock);

    expect(service.isActive('Happiness'), equals(true));
    expect(service.isActive('Sadness'), equals(false));
}
