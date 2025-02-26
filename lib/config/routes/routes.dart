import 'package:flutter/material.dart';
import 'package:link_pic/features/images/presentation/pages/image_screen.dart';
import 'package:link_pic/features/splash/presentation/pages/splash_screen.dart';

class AppRoutes {
  static const splashScreen = "/";
  static const imageScreen = "/image";
  
/// The route generator callback used when the app is navigated to a named route.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => routes[settings.name] ?? Container(),
      settings: settings,
    );
  }

  static Map<String, Widget> routes = {
    splashScreen: const SplashScreen(),
    imageScreen: const ImageScreen(),
  };
}
