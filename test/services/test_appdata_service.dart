library smairu_test.services.app_data_service;

final appDataServiceMock = [
    {
        'tab': 'Happiness',
        'data': ['(*^ω^)', '(´∀｀*)', '(-‿‿-)']
    },
    {
        'tab': 'Sadness',
        'data': ['( ╥ω╥ )', '(个_个)', '(>_<)']
    }
];

void testAppDataService() {
    group('AppDataService', (){
        test('''.load() initializes AppDataService and loads data from 
            localStorage or kaomoji site''',
            testAppDataService_load);
    });
}

void testAppDataService_load() {
    var service = new AppDataService();
    service.load(appDataServiceMock);
}
