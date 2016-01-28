library smairu.components.popup_component;

import 'dart:html';
import 'dart:async' show Timer;
import 'package:angular2/angular2.dart' show Component, View, NgFor, NgIf,
    EventEmitter;
import '../../directives/copy_directive.dart' show CopyDirective;
import '../../models.dart' show Mojiset;

@Component(
    selector: 'popup',
    properties: const ['model'],
    events: const ['returned']
)
@View(
    templateUrl: 'popup_component.html',
    styleUrls: const ['popup_component.css'],
    directives: const [NgFor, NgIf, CopyDirective]
)
class PopupComponent {
    EventEmitter returned = new EventEmitter();

    Mojiset _model;
    bool _copied = false;
    Duration _duration = const Duration(seconds: 1);

    void set model(Mojiset value) { _model = value; }

    List<String> get elements => _model.asList();
    bool get copied => _copied;
    String get title => _model.category;

    void back() {
        returned.emit(null);
    }

    void notice() {
        _copied = true;
        new Timer(_duration, () {
            _copied = false;
        });
    }
}
