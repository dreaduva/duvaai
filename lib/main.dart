import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Import the responsive_sizer plugin
import 'core/localization/app_localizations.dart';
import 'bindings/main_binding.dart';
import 'core/routes/app_routes.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Obx(
          () => GetMaterialApp(
            title: 'Duva Ai',
            theme: themeController.lightTheme,
            darkTheme: themeController.darkTheme,
            themeMode: themeController.theme,
            translations: AppLocalizations(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            initialBinding: MainBinding(),
            initialRoute: AppRoutes.splash,
            getPages: AppRoutes.pages,
          ),
        );
      },
    );
  }
}
