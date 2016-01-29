'use strict'

chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    var active = document.activeElement;

    var isPasteableElement = active.contentEditable === 'true'
        || active instanceof HTMLInputElement
        || active instanceof HTMLTextAreaElement;

    if (isPasteableElement) {
        active.textContent += ' ' + request.smile;
    }

    sendResponse(true);
});
