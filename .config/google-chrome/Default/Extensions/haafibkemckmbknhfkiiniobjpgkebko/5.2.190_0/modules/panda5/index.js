ready(function (bg) {
    var angular = window.angular = bg._.cloneDeep(bg.angular);
    window.Raven = bg.Raven;

    var pageModuleName = 'window_' + (new Date() - 147e10).toString(16);

    angular.module(pageModuleName, [])
        .value('$window', window)
        .value('$document', angular.element(document));

    angular.bootstrap(document, [
        pageModuleName,
        'panda'
    ]);

    // Check if Panda is loaded in 5 seconds, reload bg and this tab otherwise.
    setTimeout(function () {
        // Do not act if user has navigated from Panda
        if (document.querySelector('meta[property=\'pnd:app_id\']').content != 'panda5')
            return;

        if (document.querySelector('.js-main-view'))
            return;

        if (document.querySelector('.js-status-screen'))
            return;

        bg.location.reload();

        ready(function () {
            location.reload();
        });
    }, 5000);
});

function ready(cb) {
    var bgWindow = chrome.extension.getBackgroundPage();

    if (!bgWindow)
        return setTimeout(ready.bind(null, cb), 100);

    ready_(bgWindow.document, function () {
        ready_(document, function () {
            cb && cb(bgWindow);
        });
    });
}

function ready_(doc, cb) {
    if (['complete', 'interactive'].indexOf(doc.readyState) > -1)
        return cb();
    doc.addEventListener('DOMContentLoaded', cb);
}
