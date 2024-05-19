import 'package:get/get.dart';
import 'package:duvaai/core/routes/app_routes.dart';
import 'package:duvaai/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import '../data/models/user_model.dart' as appuser;

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
      duration: const Duration(seconds: 2),
    );
    rotationAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.repeat();
    _navigateToNextScreen();
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    _authController.isSplashScreenCompleted = true;
    _checkUserState(_authController.user);
  }

  void _onAuthStateChanged(User? user) {
    if (_authController.isSplashScreenCompleted) {
      _checkUserState(user);
    }
  }

  void _checkUserState(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      _authController.currentUser.value = appuser.User(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        profileImageUrl: user.photoURL ?? '',
        lastLogin: DateTime.now(),
      );
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }
}
