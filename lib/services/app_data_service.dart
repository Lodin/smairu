library smairu.services.app_data_service;

import 'package:angular2/angular2.dart' show Injectable;
import '../models.dart' show MojisetCollection;

@Injectable()
class AppDataService {
    MojisetCollection _collection;
    List<String> _tabs;

    MojisetCollection get collection => _collection;

    void load(List<Map<String>> data) {
        _collection = new MojisetCollection.from(data);
        
        _tabs = _collection
            .toList()
            .map((Mojiset el) => el.tab)
            .toList();
    }

    List<String> get tabs => _tabs;

    void select(String tab) {
        _collection.cursor.move(_tabs.indexOf(tab));
    }

    bool isActive(String tab) => _collection.current.tab == tab;
}
