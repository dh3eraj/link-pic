
import '../libraries/js_interop_library.dart';
///Used to access [javascript] function
class JsInteropService {

  /// Toggles Fullscreen
  callToggleFullscreen() {
    toggleFullscreen();
  }

  /// Used to enter fullscreen
  callEnterFullscreen() {
    enterFullscreen();
  }

  /// Used to exit fullscreen
  callExitFullscreen() {
    exitFullscreen();
  }
}
