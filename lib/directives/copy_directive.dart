library smairu.directives.copy_directive;

import 'dart:html' show document, window, Range;
import 'package:angular2/angular2.dart' show Directive, ElementRef;
import 'package:chrome/chrome_app.dart' as chrome;

@Directive(
    selector: '[copy]',
    inputs: const ['copy'],
    host: const {
        '(click)': 'onClick()'
    }
)
class CopyDirective {
    String _copy;
    ElementRef _element;

    CopyDirective(this._element) {}

    void set copy(String value) { _copy = value; }

    void onClick() {
        var range = _createRange();
        var selection = window.getSelection();
        selection.addRange(range);
        document.execCommand('Copy', false, null);
        selection.removeAllRanges();

        sendMessage();   
    }

    Range _createRange() {
        var range = new Range();
        var root = _element.nativeElement;
        range.setStartBefore(root);
		range.setEndAfter(root);
		range.selectNode(root);

        return range;
    }

    void _sendMessage() {
        var params = new chrome.TabsQueryParams(
            active: true,
            currentWindow: true
        );

        chrome.tabs.query(params).then((List<chrome.Tab> tabs) {
            chrome.tabs.sendMessage(tabs[0].id, {'smile': _copy});
        });
    }
}
