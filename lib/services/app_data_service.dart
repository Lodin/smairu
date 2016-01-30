library smairu.services.app_data_service;

import 'dart:html' show window;
import 'dart:convert' show JSON;
import 'package:angular2/angular2.dart' show Injectable;
import '../models.dart' show Mojiset, MojisetCollection;

/// Service to rule whole application. Contains all data of application.
@Injectable()
class AppDataService {
    MojisetCollection _collection;
    List<String> _categories;

    /// Gets emoji set collection.
    MojisetCollection get collection => _collection;

    /// Transforms received [data] to internal representation.
    void load(List<Map<String>> data) {
        _collection = new MojisetCollection.from(data);
        
        _categories = _collection
            .toList()
            .map((Mojiset el) => el.category)
            .toList();
    }

    /// Gets list of set categories.
    List<String> get categories => _categories;

    /// Sets state of emoji set collection to [category].
    void select(String category) {
        _collection.cursor.move(_categories.indexOf(category));
    }

    /// Checks if the current state of collection is equal to [category].
    bool isActive(String category) => _collection.current.category == category;

    void remember(List<Map> data) {
        window.localStorage['data'] = JSON.encode(data);
    }
}
