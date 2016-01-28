library smairu.components.menu_component;

import 'package:angular2/angular2.dart' show Component, View, NgFor,
    EventEmitter;

@Component(
    selector: 'menu',
    properties: const ['categories'],
    events: const ['selected']
)
@View(
    templateUrl: 'menu_component.html',
    styleUrls: const ['menu_component.css'],
    directives: const [NgFor]
)
class MenuComponent {
    EventEmitter selected = new EventEmitter();
    List<String> _categories;

    List<String> get categories => _categories;
    void set categories(List<String> value) { print(value); _categories = value; }

    select(String category) { selected.emit(category); }
}
