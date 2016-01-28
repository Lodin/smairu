library smairu.models.mojiset;

import 'package:quiver/core.dart' show hash2;
import 'package:collection/equality.dart' show ListEquality;
import '../utils.dart' show Cursor;

/// Incapsulates data of one category with emoji table, and methods to control it.
class Mojiset {
    String _category;
    List<String> _data;

    /// Loads [value] contains complete data into Mojiset.
    Mojiset.from(Map<String> value) {
        _category = value['category'];
        _data = new List<String>.from(value['data']);
    }

    /// Creates Mojiset with only [category] name.
    Mojiset.fromCategory(String category) {
        _category = category;
        _data = null;
    }

    /// Returns one emoji by [index]. 
    String operator [](int index) => _data[index];
    
    /// Sets one emoji on [index] to [value].
    void operator []=(int index, String value) {
        _data[index] = value;
    }
    
    /// Returns true if two Mojiset object is equal.
    bool operator ==(dynamic object) => object is Mojiset
        && _category == object._category
        && const ListEquality().equals(_data, object._data);

    /// Returns current object hash code.
    int get hashCode => hash2(_category.hashCode, _data.hashCode);

    /// Returns true if Mojiset object does not contains any emoji.
    bool get isEmpty => _data == null || _data.isEmpty;
    
    /// Gets Mojiset category name.
    String get category => _category;

    /// Gets full list of emoji in List format.
    List<String> asList() => _data;
    
    /// Adds new emoji with [value], or empty place (if [value] is null).
    void add([String value]) {
        _data.add(value);
    }

    /// Removes [value] element from Mojiset.
    void remove(String value) {
        _data.remove(value);
    }

    /// Removes Mojiset element at [index].
    void removeAt(int index) {
        _data.removeAt(index);   
    }

    /// Returns a string representation of Mojiset object.
    String toString() {
        return { 
            'category': _category,
            'data': _data
        }.toString();
    }
}
