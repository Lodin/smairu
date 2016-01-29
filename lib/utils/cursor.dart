library smairu.utils.cursor;

import 'smairu_exception.dart';

/// Incapsulates current state of collection with ability to set this state
/// manually.
class Cursor {
    int _value = 0;
    final int _max;

    /// Creates new instance of Cursor with maximal bound. 
    Cursor(this._max) {}

    /// Gets current state.
    int get current => _value;

    /// Checks if the next element of collection exists.
    bool get nextExists => _value < _max - 1;

    /// Checks if the previous element of collection exists.
    bool get previousExists => _value > 0;

    /// Moves cursor to next element if it possible.
    void next() {
        if (!nextExists) {
            throw new SmairuException('Cursor value cannot exceed $_max');
        }

        _value += 1;
    }

    /// Moves cursor to previous element if it possible.
    void previous() {
        if (!previousExists) {
            throw new SmairuException('Cursor value cannot be under 0');
        }

        _value -= 1;
    }

    /// Move cursor to custom element if it possible.
    void move(int index) {
        if (index >= _max || index < 0) {
            throw new SmairuException('Cursor value should be between 0 and $_max');
        }

        _value = index;
    }
}
