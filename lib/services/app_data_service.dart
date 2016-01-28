library smairu.services.app_data_service;

import 'package:angular2/angular2.dart' show Injectable;
import '../models.dart' show MojisetCollection;

@Injectable()
class AppDataService {
    MojisetCollection _collection;
    List<String> _categories;

    MojisetCollection get collection => _collection;

    void load(List<Map<String>> data) {
        _collection = new MojisetCollection.from(data);
        
        _categories = _collection
            .toList()
            .map((Mojiset el) => el.category)
            .toList();
    }

    List<String> get categories => _categories;

    void select(String category) {
        _collection.cursor.move(_categories.indexOf(category));
    }

    bool isActive(String category) => _collection.current.category == category;
}
