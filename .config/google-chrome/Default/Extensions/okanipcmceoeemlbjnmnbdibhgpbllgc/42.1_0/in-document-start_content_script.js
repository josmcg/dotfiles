(function(){ /*
 Copyright 2010 Google Inc.  All Rights Reserved.
 Your use of this software is subject to the Terms of Service located
 at https://chrome.google.com/extensions/intl/en/gallery_tos.html.
*/
if(!window["qs-in-document"]){window["qs-in-document"]=!0;var idscs_a=/https?:\/\/(?:.+\.)?google\.[a-z]{2,3}(?:\.[a-z]{2})?(?:\:[0-9]+)?\/url.*[?&]q=([^&]+)/,idscs_b=/https?:\/\/(?:.+\.)?google\.[a-z]{2,3}(?:\.[a-z]{2})?(?:\:[0-9]+)?\/url.*[?&]ei=([^&]+)/,idscs_c=/https?:\/\/(?:.+\.)?google\.[a-z]{2,3}(?:\.[a-z]{2})?(?:\:[0-9]+)?\//,idscs_d=document.referrer.match(/https?:\/\/(?:.+\.)?google\.[a-z]{2,3}(?:\.[a-z]{2})?(?:\:[0-9]+)?\/search.*[?&]q=([^&]+)/)||document.referrer.match(idscs_a)||document.referrer.match(idscs_b),
idscs_;!document.referrer||idscs_c.test(document.referrer)?idscs_="":idscs_d&&(idscs_=decodeURIComponent(idscs_d[1].replace(/\+/g," ")));null!=idscs_&&chrome.extension.connect({name:"landing-page"}).postMessage({href:document.location.href,subkey:idscs_})}; })();
