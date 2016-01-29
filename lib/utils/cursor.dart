library smairu.utils.cursor;

import 'smairu_exception.dart';

class Cursor {
    int _value = 0;
    final int _max;

    Cursor(this._max) {}

    int get current => _value;
    bool get nextExists => _value < _max - 1;
    bool get previousExists => _value > 0;

    void next() {
        if (!nextExists) {
            throw new SmairuException('Cursor value cannot exceed $_max');
        }

        _value += 1;
    }

    void previous() {
        if (!previousExists) {
            throw new SmairuException('Cursor value cannot be under 0');
        }

        _value -= 1;
    }

    void move(int index) {
        if (index >= _max || index < 0) {
            throw new SmairuException('Cursor value should be between 0 and $_max');
        }

        _value = index;
    }
}
