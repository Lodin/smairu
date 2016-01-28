library smairu.directives.copy_directive;

import 'dart:html' show document, window, Range;
import 'package:angular2/angular2.dart' show Directive, ElementRef;

@Directive(
    selector: '[copy]',
    host: const {
        '(click)': 'onClick()'
    }
)
class CopyDirective {
    ElementRef _element;

    CopyDirective(this._element) {}

    void onClick() {
        var range = _createRange();
        var selection = window.getSelection();
        selection.addRange(range);
        document.execCommand('Copy', false, null);
        selection.removeAllRanges();
    }

    Range _createRange() {
        var range = new Range();
        var root = _element.nativeElement;
        range.setStartBefore(root);
		range.setEndAfter(root);
		range.selectNode(root);

        return range;
    }
}
