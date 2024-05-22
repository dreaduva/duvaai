import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../data/models/user_model.dart' as appuser;
import '../core/routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Rx<appuser.User?> currentUser = Rx<appuser.User?>(null);
  var isLoading = false.obs;

  User? get user => _auth.currentUser;

  Future<void> loginWithGoogle() async {
    isLoading.value = true; // Set loading to true
    try {
      await GoogleSignIn()
          .signOut(); // Sign out from GoogleSignIn to choose a different account

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        isLoading.value = false; // Set loading to false if cancelled
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      await _saveUserToFirestore(userCredential.user);

      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      _showSnackBar('Login Error', e.toString());
    } finally {
      isLoading.value = false; // Set loading to false after process
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

      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      _showSnackBar('Login Error', e.toString());
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await _saveUserToFirestore(userCredential.user);

      Get.offAllNamed(AppRoutes.dashboard);
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

      Get.offAllNamed(AppRoutes.dashboard);
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

  Future<void> signOut() async {
    await GoogleSignIn().signOut(); // Sign out from GoogleSignIn
    await _auth.signOut(); // Sign out from FirebaseAuth
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.login);
  }

  void _showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
