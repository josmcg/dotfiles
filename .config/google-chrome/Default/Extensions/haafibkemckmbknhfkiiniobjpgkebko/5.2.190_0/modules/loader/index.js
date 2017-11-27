(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var launchers = {
    PANDA5: 'panda5',
    SHORTCUT: 'shortcut',
    ZEN: 'zen',
    LAUNCHER: 'launcher'
};

if (typeof angular != 'undefined') {
    angular.module('panda').constant('LauncherTypes', launchers);
}

module.exports = launchers;

},{}],2:[function(require,module,exports){
var ls = window.localStorage;

function LaunchConfig() {}

LaunchConfig.prototype.getLauncher = function () {
    var enforcedMode = location.hash.match(/[\?&]module=([^&]+)/);
    var tempMode = JSON.parse(ls.getItem('ls.launcher.mode.temp'));

    if (enforcedMode && enforcedMode[1])
        return enforcedMode[1];

    if (tempMode) {
        ls.removeItem('ls.launcher.mode.temp');
        return tempMode;
    }

    return JSON.parse(ls.getItem('ls.launcher'));
};

LaunchConfig.prototype.setLauncher = function (launcher) {
    ls.setItem('ls.launcher', JSON.stringify(launcher));
};

LaunchConfig.prototype.isPreview = function () {
    return !!window._pnd_launcherPreview;
};

LaunchConfig.prototype.getPreviewLauncher = function () {
    return window._pnd_launcherPreview && window._pnd_launcherPreview.launcher;
};

LaunchConfig.prototype.getPreviewLaunchMode = function () {
    return window._pnd_launcherPreview && window._pnd_launcherPreview.mode;
};

LaunchConfig.prototype.getPreviewSettings = function () {
    return window._pnd_launcherPreview && window._pnd_launcherPreview.settings;
};

LaunchConfig.prototype.getLaunchMode = function () {
    return JSON.parse(ls.getItem('ls.launcher.mode'));
};

LaunchConfig.prototype.setLaunchMode = function (mode) {
    ls.setItem('ls.launcher.mode', JSON.stringify(mode));
};

LaunchConfig.prototype.getActiveLaunchers = function () {
    var activeModes = [];

    Array.prototype.slice.call(document.body.classList)
        .forEach(function (className) {
            if (className.indexOf('pnd-') == 0) activeModes.push(className.substr(4));
        });

    return activeModes;
};

LaunchConfig.prototype.isLauncherActive = function (mode) {
    return this.getActiveLaunchers().indexOf(mode) >= 0;
};

var instance = new LaunchConfig();

if (typeof angular != 'undefined') {
    angular.module('panda').constant('LaunchConfig', instance);
}

module.exports = instance;

},{}],3:[function(require,module,exports){
var LaunchConfig = require('panda/services/launch-config');
var LauncherTypes = require('panda/data/launcher/types');

var ls = window.localStorage;

window._pnd_loadModule = loadModule;
window._pnd_loadVendor = loadVendor;

(function init() {
    var preview = LaunchConfig.isPreview();
    var tempLauncher = JSON.parse(ls.getItem('ls.launcher.temp'));
    var launcher = tempLauncher || LaunchConfig.getLauncher() || LauncherTypes.PANDA5;

    window._pnd_module_callbacks = {};

    if (preview)
        launcher = LaunchConfig.getPreviewLauncher();

    loadModule(launcher, function () {
        if (window._pnd_module_callbacks[launcher]) {
            window._pnd_module_callbacks[launcher]({
                loadModule: loadModule
            });
            delete window._pnd_module_callbacks[launcher];
        }

        tempLauncher && ls.removeItem('ls.launcher.temp');
    });

    registerAppToBackground();
    sendAnalytics(launcher);
})();


/**
 * Script loader (inspired from jQuery.getScript, removed legacy IE workarounds)
 * @param {string} module Module name.
 * @param {Function=} cb Optional callback.
 */
function loadModule(module, cb) {
    var head = document.getElementsByTagName('head')[0];
    var done = false;

    var script = document.createElement('script');
    script.src = './modules/' + module + '/index.js';
    script.onload = script.onreadystatechange = function () {
        if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
            done = true;
            cb && cb();
        }
        document.body.classList.add('pnd-' + module);
    };

    head.appendChild(script);
}

function loadVendor(vendor, cb) {
    var head = document.getElementsByTagName('head')[0];
    var done = false;

    var script = document.createElement('script');
    script.src = './vendors/' + vendor + '.js';
    script.onload = script.onreadystatechange = function () {
        if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
            done = true;
            cb && cb();
            return;
        }
    };

    head.appendChild(script);
}

function registerAppToBackground() {
    if (!window.chrome || !chrome.extension) return;
    chrome.tabs.getSelected(function (tab) {
        var bgWindow = chrome.extension.getBackgroundPage();

        if (!bgWindow || !bgWindow.pnd)
            return;

        bgWindow.pnd.tabs.register(tab.id);
    });
}

function sendAnalytics(launcher) {
    if (!window.chrome || !chrome.extension || launcher == LauncherTypes.PANDA5)
        return;

    chrome.extension.getBackgroundPage()
        .pnd.events.trackLauncher(launcher, LaunchConfig.getLaunchMode());
}

},{"panda/data/launcher/types":1,"panda/services/launch-config":2}]},{},[3]);
