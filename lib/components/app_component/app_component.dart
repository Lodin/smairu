library smairu.components.app_component;

import 'dart:html' show window;
import 'dart:convert' show JSON;
import 'package:angular2/angular2.dart' show Component, View, NgIf;
import '../../components.dart' show PopupComponent, MenuComponent;
import '../../services.dart' show AppDataService, DataLoader;
import '../../models.dart' show Mojiset;

@Component(
    selector: 'app',
    providers: const [AppDataService, DataLoader]
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
    DataLoader _loader;
    bool _activePopup = false;

    AppComponent(this._service, this._loader) {
        if (!window.localStorage.containsKey('data')) {
            _loader.process().then((List<Map> data) {
                _service.load(data);
                _service.remember(data);
            });
        } else {
            _service.load(JSON.decode(window.localStorage['data']));
        }
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
