// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_localizations.dart';
import 'bindings/auth_binding.dart';
import 'core/routes/app_routes.dart';
import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Duva Ai',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: AppTheme.lightTheme.textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
        textTheme: AppTheme.darkTheme.textTheme,
      ),
      themeMode: ThemeMode.system,
      translations: AppLocalizations(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      initialBinding: AuthBinding(),
      initialRoute: _authController.user == null ? AppRoutes.login : AppRoutes.dashboard,
      getPages: AppRoutes.pages,
    );
  }
}
