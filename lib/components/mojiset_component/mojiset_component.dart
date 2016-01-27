library smairu.components.mojiset_component;

import 'package:angular2/angular2.dart' show Component, View, NgFor;
import '../../models.dart' show Mojiset;

@Component(
    selector: 'mojiset',
    properties: const ['model']
)
@View(
    templateUrl: 'mojiset_component.html',
    styleUrls: const ['mojiset_component.css'],
    directives: const [NgFor]
)
class MojisetComponent {
    Mojiset _model;

    void set model(Mojiset value) { _model = value; }

    List<String> get elements => _model.asList();
}
