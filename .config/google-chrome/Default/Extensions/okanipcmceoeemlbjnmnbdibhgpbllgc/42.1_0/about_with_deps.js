/*
 Copyright 2010 Google Inc.  All Rights Reserved.
 Your use of this software is subject to the Terms of Service located
 at https://chrome.google.com/extensions/intl/en/gallery_tos.html.
*/
function b(){chrome.tabs.create({url:"http://www.google.com/search?q=dark+matter+brown+dwarfs"});return!1}
jQuery(function(){jQuery("head").append(jQuery('<link rel="stylesheet" type="text/css" href="about_'+chrome.i18n.getMessage("direction")+'_css.css"/>'));jQuery("body").attr("dir",chrome.i18n.getMessage("direction"));var c=chrome.i18n.getMessage("locale");jQuery("[data-msg]").each(function(e,a){var d=a.getAttribute("data-msg");a.innerHTML=chrome.i18n.getMessage(d,a.hasAttribute("data-use-locale")?c:"")});jQuery("#container").show();window.localStorage.welcome||(jQuery("#title").text(chrome.i18n.getMessage("qs_about_installed")),
window.localStorage.welcome="true");document.referrer||jQuery("#sample-query").click(b)});
