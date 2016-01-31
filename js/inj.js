'use strict'

chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    var active = document.activeElement;

    if (isPasteableElement(active)) {
        if (active.textContent !== '') {
            active.textContent = insert2string(
                active.textContent,
                getCursorPosition(),
                request.smile
            );
        } else {
            active.textContent = request.smile;
        }
    }

    sendResponse(true);
});

function isPasteableElement(element) {
    return element.contentEditable === 'true'
        || element instanceof HTMLInputElement
        || element instanceof HTMLTextAreaElement;
}

function getCursorPosition() {
    return window.getSelection().getRangeAt(0).startOffset;
}

function insert2string(string, index, value) {
    return string.substring(0, index)
        + value
        + string.substring(index);
}
