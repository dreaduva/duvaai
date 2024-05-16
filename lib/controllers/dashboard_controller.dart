// lib/controllers/dashboard_controller.dart
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_controller.dart';

class DashboardController extends GetxController {
  final AuthController _authController = Get.find();
  User? get user => _authController.user;

  void signOut() {
    _authController.signOut();
  }
}
