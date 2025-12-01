// START OF FILE

// increase number of network connections
user_pref("network.http.max-connections", 4096);
user_pref("network.http.max-persistent-connections-per-proxy", 128);
user_pref("network.http.max-persistent-connections-per-server", 128);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 128);


// block all trackers
user_pref("browser.contentblocking.category", "strict");

// use HTTPS Only mode
user_pref("dom.security.https_only_mode", true);


// block desktop notifications
user_pref("permissions.default.desktop-notification", 2);

// block location tracking
user_pref("permissions.default.geo", 2);

// block VR detection
user_pref("permissions.default.xr", 2);

// disable autoplay for audio and video
user_pref("media.autoplay.default", 5);

// disable camera and microphone
user_pref("permissions.default.microphone", 2);
user_pref("permissions.default.camera", 2);


// disable preference for WEBP - treat all as equal
user_pref("image.http.accept", "*/*");


// set preferred languages
user_pref("intl.accept_languages", "en,zh,ja");


// DNS-over-HTTPS
// 0 = disable, 2 = enable and prefer
user_pref("network.trr.mode", 2);


// disable right-click hijacking
user_pref("dom.event.contextmenu.enabled", false);


// disable mouse wheel actions
user_pref("mousewheel.with_alt.action", 0);
user_pref("mousewheel.with_control.action", 0);
user_pref("mousewheel.with_meta.action", 0);
user_pref("mousewheel.with_shift.action", 0);
user_pref("mousewheel.with_win.action", 0);


// disable headers and footers in printing
user_pref("print.print_footerleft", "");
user_pref("print.print_footercenter", "");
user_pref("print.print_footerright", "");
user_pref("print.print_headerleft", "");
user_pref("print.print_headercenter", "");
user_pref("print.print_headerright", "");


// set default fonts
user_pref("font.default.x-western", "sans-serif");
user_pref("font.size.variable.x-western", 15);
user_pref("font.size.monospace.x-western", 13);


// disable ML
user_pref("browser.ml.enable", false);
user_pref("browser.ml.chat.enable", false);


// custom user.js for samktan
// place this last to confirm it was reached
user_pref("samktan.user.js.version", "MMXXV-VIII-XiV");

