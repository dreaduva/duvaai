import 'package:get/get.dart';
import 'package:duvaai/core/routes/app_routes.dart';
import 'package:duvaai/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/models/user_model.dart' as appuser;

class SplashController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));

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
