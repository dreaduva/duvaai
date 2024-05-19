import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_controller.dart';

class DashboardController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();
  User? get user => _authController.user;

  final RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void signOut() {
    _authController.signOut();
  }
}
