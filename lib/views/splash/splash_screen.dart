import 'package:duvaai/controllers/auth_controller.dart';
import 'package:duvaai/controllers/splash_comtroller.dart';
import 'package:duvaai/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:duvaai/animations/rotating_logo_animation.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final AuthController _authController = Get.find();
  final SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatingLogoAnimation(
              child: SvgPicture.asset(
                'assets/images/duva_ai_edited.svg',
                width: 200.0,
                height: 200.0,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
                semanticsLabel: 'Company Logo',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'DUVA AI',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: 20),
            Text(
              '"Your Personal Business Assistant"',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
