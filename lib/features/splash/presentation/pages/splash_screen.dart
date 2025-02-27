import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:link_pic/config/routes/routes.dart';
import 'package:link_pic/core/constants/app_lotties.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Size _size;
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.imageScreen,
          (routes) => false,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeStatusListener((listener){});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF288fee),
      body: Center(
        child: Lottie.asset(
          controller: _animationController,
          AppLotties.splash,
          height: _size.height,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
