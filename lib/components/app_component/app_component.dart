library smairu.components.app_component;

import 'package:angular2/angular2.dart' show Component, View, NgFor;
import '../../components.dart' show MojisetComponent;
import '../../services.dart' show AppDataService;
import '../../models.dart' show Mojiset;

final mock = [
    {
        'tab': 'Happiness',
        'data': ['(*^ω^)', '(´∀｀*)', '(-‿‿-)']
    },
    {
        'tab': 'Sadness',
        'data': ['( ╥ω╥ )', '(个_个)', '(>_<)']
    }
];

@Component(
    selector: 'app',
    providers: const [AppDataService]
)
@View(
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [
        MojisetComponent,
        NgFor
    ]
)
class AppComponent {
    AppDataService _service;

    AppComponent(this._service) {
        _service.load(mock);
    }

    List<String> get tabs => _service.tabs;
    
    Mojiset get current => _service.collection.current;

    

    bool isActive(String tab) => _service.isActive(tab);

    void select(String tab) { _service.select(tab); }
    void addTab() { print('Added'); }
}
