import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../data/models/user_model.dart' as appuser;
import '../data/repositories/auth_repository.dart';
import '../core/routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthRepository _authRepository = AuthRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Rx<appuser.User?> currentUser = Rx<appuser.User?>(null);
  bool isSplashScreenCompleted = false;

  User? get user => _auth.currentUser;

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      await _saveUserToFirestore(userCredential.user);

      if (isSplashScreenCompleted) {
        Get.offAllNamed(AppRoutes.dashboard);
      }
    } catch (e) {
      _showSnackBar('Login Error', e.toString());
    }
  }

  Future<void> loginWithApple() async {
    try {
      final appleCredential =
          await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(oauthCredential);
      await _saveUserToFirestore(userCredential.user);

      if (isSplashScreenCompleted) {
        Get.offAllNamed(AppRoutes.dashboard);
      }
    } catch (e) {
      _showSnackBar('Login Error', e.toString());
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: emailController.text.trim(),
      );
      await _saveUserToFirestore(userCredential.user);

      if (isSplashScreenCompleted) {
        Get.offAllNamed(AppRoutes.dashboard);
      }
    } on FirebaseAuthException catch (e) {
      _showSnackBar('Login Error', e.message ?? 'Unknown error');
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: emailController.text.trim(),
      );
      await _saveUserToFirestore(userCredential.user);

      if (isSplashScreenCompleted) {
        Get.offAllNamed(AppRoutes.dashboard);
      }
    } on FirebaseAuthException catch (e) {
      _showSnackBar('Sign Up Error', e.message ?? 'Unknown error');
    }
  }

  Future<void> _saveUserToFirestore(User? user) async {
    if (user != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      final userData = {
        'id': user.uid,
        'name': user.displayName ?? '',
        'email': user.email ?? '',
        'profileImageUrl': user.photoURL ?? '',
        'lastLogin': DateTime.now(),
      };
      await userDoc.set(userData, SetOptions(merge: true));
      currentUser.value = appuser.User(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        profileImageUrl: user.photoURL ?? '',
        lastLogin: DateTime.now(),
      );
    }
  }

  void signOut() async {
    await _auth.signOut();
    currentUser.value = null;
    if (isSplashScreenCompleted) {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void _showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
    );
  }
}
