// lib/views/auth/login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/utils/constants.dart';
import '../../controllers/auth_controller.dart';
 

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _authController.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: paddingMedium),
            TextField(
              controller: _authController.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: paddingLarge),
            ElevatedButton(
              onPressed: () => _authController.login(),
              style: ElevatedButton.styleFrom(
              
                padding: EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingMedium),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.to(SignUpPage()),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _authController.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: paddingMedium),
            TextField(
              controller: _authController.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: paddingLarge),
            ElevatedButton(
              onPressed: () => _authController.signUp(),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingMedium),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
