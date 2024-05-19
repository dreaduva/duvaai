import 'package:duvaai/common/utils/constants.dart';
import 'package:duvaai/views/auth/email_login_page.dart';
import 'package:duvaai/views/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/duva_ai_edited.svg',
                width: 150.0,
                height: 150.0,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
                semanticsLabel: 'Company Logo',
              ),
              const SizedBox(height: 20),
              const Text(
                'DUVA AI',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _authController.loginWithGoogle(),
                icon: const Icon(Icons.g_mobiledata),
                label: const Text('Login with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingLarge, vertical: paddingSmall),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(height: paddingMedium),
              ElevatedButton.icon(
                onPressed: () => _authController.loginWithApple(),
                icon: const Icon(Icons.apple),
                label: const Text('Login with Apple'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingLarge, vertical: paddingSmall),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(height: paddingMedium),
              ElevatedButton.icon(
                onPressed: () => Get.to(EmailLoginPage()),
                icon: const Icon(Icons.email),
                label: const Text('Login with Email'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  foregroundColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingLarge, vertical: paddingSmall),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Get.to(SignUpPage()),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
