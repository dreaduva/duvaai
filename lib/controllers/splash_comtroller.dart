import 'package:get/get.dart';
import 'package:duvaai/core/routes/app_routes.dart';
import 'package:duvaai/controllers/auth_controller.dart';

class SplashController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    print("SplashController initialized");
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    print("Waiting for 3 seconds");
    await Future.delayed(const Duration(seconds: 3));
    print("Navigating to the next screen");
    if (_authController.user == null) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }
}
