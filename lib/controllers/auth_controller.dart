// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../views/auth/login_page.dart';
import '../views/dashboard/dashboard_page.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  User? get user => _auth.currentUser;

  void login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => DashboardPage()); // Navigate to DashboardPage
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Error', e.message ?? 'Unknown error');
    }
  }

  void signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => DashboardPage()); // Navigate to DashboardPage
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Sign Up Error', e.message ?? 'Unknown error');
    }
  }

  void signOut() async {
    await _auth.signOut();
    Get.offAll(() => LoginPage()); // Navigate to LoginPage
  }
}
