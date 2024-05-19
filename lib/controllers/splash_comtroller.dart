import 'package:get/get.dart';
import 'package:duvaai/core/routes/app_routes.dart';
import 'package:duvaai/controllers/auth_controller.dart';
import 'package:flutter/animation.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuthController _authController = Get.find<AuthController>();
  late AnimationController animationController;
  late Animation<double> rotationAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    rotationAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.repeat();
    _navigateToNextScreen();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    _authController.user == null
        ? Get.offAllNamed(AppRoutes.login)
        : Get.offAllNamed(AppRoutes.dashboard);
  }
}
