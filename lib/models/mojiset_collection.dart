library smairu.models.mojiset_collection;

import 'mojiset.dart' show Mojiset;
import '../utils.dart' show Cursor;

/// Collection of Mojiset objects
class MojisetCollection {
    Cursor _cursor;
    List<Mojiset> _data;

    /// Creates new collection from [data].
    MojisetCollection.from(List<Map<String>> data) {
        _cursor = new Cursor(data.length);
        _data = new List<Mojiset>()
            ..length = data.length;

        for (var i = 0, len = data.length; i < len; i++) {
            _data[i] = new Mojiset.from(data[i]);
        }
    }

    /// Gets collection element by its [index].
    Mojiset operator [](int index) => _data[index];

    /// Sets collection element at [index] to [value].
    Mojiset operator []=(int index, Mojiset value) {
        _data[index] = value;
    }

    /// Gets current collection cursor.
    Cursor get cursor => _cursor;

    /// Gets collection length.
    int get length => _data.length;

    /// Gets current element of collection the inner cursor pointing at.
    Mojiset get current => _data[cursor.current];

    /// Gets first element of collection.
    Mojiset get first => _data.first;

    /// Gets last element of collection.
    Mojiset get last => _data.last;

    /// Adds new Mojiset [object] to collection.
    add(Mojiset object) { _data.add(object); }

    /// Removes [object] from collection.
    remove(Mojiset object) { _data.remove(object); }

    /// Removes element from collection by [index].
    removeAt(int index) { _data.removeAt(index); }

    /// Transforms collection to List.
    List<Mojiset> toList() => _data;

    /// Returns a string representation of MojisetCollection.
    String toString() {
        return _data.toString();
    }
}
