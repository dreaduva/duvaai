import 'package:duvaai/controllers/splash_comtroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/duva_ai_edited.svg', // Path to your SVG logo
          width: 200.0,
          height: 200.0,
          placeholderBuilder: (context) => CircularProgressIndicator(),
          semanticsLabel: 'Company Logo',
        ),
      ),
    );
  }
}
