import 'package:duvaai/controllers/splash_comtroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:duvaai/animations/rotating_logo_animation.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Import the responsive_sizer plugin

class SplashScreen extends StatelessWidget {
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
                width: 50.w, // Adjusted width using responsive_sizer
                height: 50.w, // Adjusted height using responsive_sizer
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
                semanticsLabel: 'Company Logo',
              ),
            ),
            SizedBox(height: 5.h), // Adjusted height using responsive_sizer
            Text(
              'Duva AI',
              style: TextStyle(
                  fontSize: 22.sp, // Adjusted font size using responsive_sizer
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(height: 3.h), // Adjusted height using responsive_sizer
            Text(
              '"Your Personal Business Assistant"',
              style: TextStyle(
                fontSize: 18.sp, // Adjusted font size using responsive_sizer
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
