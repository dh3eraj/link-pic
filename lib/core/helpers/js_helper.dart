export 'js_helper_mobile.dart' // Default for mobile platforms
if (dart.library.js) 'js_helper_web.dart'; // Use the web-specific file when compiled for web.