library smairu.components.popup_component;

import 'package:angular2/angular2.dart' show Component, View, NgFor;
//import 'package:chrome/chrome_app.dart' as chrome;
import '../../models.dart' show Mojiset;

@Component(
    selector: 'popup',
    properties: const ['model']
)
@View(
    templateUrl: 'popup_component.html',
    styleUrls: const ['popup_component.css'],
    directives: const [NgFor]
)
class PopupComponent {
    Mojiset _model;

    void set model(Mojiset value) { _model = value; }

    List<String> get elements => _model.asList();

    void copy(String element) {
        print(element);
    }
}
