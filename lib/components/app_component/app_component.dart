library smairu.components.app_component;

import 'package:angular2/angular2.dart' show Component, View, NgIf;
import '../../components.dart' show PopupComponent, MenuComponent;
import '../../services.dart' show AppDataService;
import '../../models.dart' show Mojiset;

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

@Component(
    selector: 'app',
    providers: const [AppDataService]
)
@View(
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [
        PopupComponent,
        MenuComponent,
        NgIf
    ]
)
class AppComponent {
    AppDataService _service;
    bool _activePopup = false;

    AppComponent(this._service) {
        _service.load(mock);
    }

    bool get activePopup => _activePopup;
    List<String> get categories => _service.categories;
    Mojiset get current => _service.collection.current;

    select(String category) {
        _service.select(category);
        _activePopup = true;
    }

    close() {
        _activePopup = false;
    }
}
