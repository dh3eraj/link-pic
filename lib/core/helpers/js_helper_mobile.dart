class JsInteropService {
  /// Toggles Fullscreen
  Future<String> callToggleFullscreen() {
    return Future.value("Not supported on Mobile");
  }

  /// Used to enter fullscreen
  Future<String> callEnterFullscreen() async {
    return Future.value("Not supported on Mobile");
  }

  /// Used to exit fullscreen
  Future<String> callExitFullscreen() {
    return Future.value("Not supported on Mobile");
  }
}
