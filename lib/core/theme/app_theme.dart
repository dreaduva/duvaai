import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color seedColor = Colors.green;
  static final TextTheme baseTextTheme = GoogleFonts.latoTextTheme();

  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: baseTextTheme.displayLarge?.copyWith(
        fontSize: 57, fontWeight: FontWeight.bold, letterSpacing: -0.25),
    displayMedium: baseTextTheme.displayMedium
        ?.copyWith(fontSize: 45, fontWeight: FontWeight.bold, letterSpacing: 0),
    displaySmall: baseTextTheme.displaySmall
        ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 0),
    headlineLarge: baseTextTheme.headlineLarge
        ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0),
    headlineMedium: baseTextTheme.headlineMedium
        ?.copyWith(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 0),
    headlineSmall: baseTextTheme.headlineSmall
        ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0),
    titleLarge: baseTextTheme.titleLarge
        ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 0),
    titleMedium: baseTextTheme.titleMedium
        ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0),
    titleSmall: baseTextTheme.titleSmall
        ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0),
    bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    bodySmall: baseTextTheme.bodySmall?.copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0.1),
    labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.5),
    labelSmall: baseTextTheme.labelSmall?.copyWith(
        fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: seedColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: seedColor,
      ),
    ),
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: baseTextTheme.displayLarge?.copyWith(
        color: Colors.white,
        fontSize: 57,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.25),
    displayMedium: baseTextTheme.displayMedium?.copyWith(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    displaySmall: baseTextTheme.displaySmall?.copyWith(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    titleLarge: baseTextTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    titleMedium: baseTextTheme.titleMedium?.copyWith(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    titleSmall: baseTextTheme.titleSmall?.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0),
    bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5),
    bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25),
    bodySmall: baseTextTheme.bodySmall?.copyWith(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.4),
    labelLarge: baseTextTheme.labelLarge?.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.1),
    labelMedium: baseTextTheme.labelMedium?.copyWith(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5),
    labelSmall: baseTextTheme.labelSmall?.copyWith(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: seedColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: seedColor,
      ),
    ),
  );

  // Helper methods to access color scheme more easily
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color onPrimary(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;
  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static Color onSecondary(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondary;
  static Color surface(BuildContext context) =>
      Theme.of(context).colorScheme.surface;
  static Color onSurface(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  // Helper methods to access text theme more easily
  static TextStyle displayLarge(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge!;
  static TextStyle displayMedium(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium!;
  static TextStyle displaySmall(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall!;
  static TextStyle headlineLarge(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge!;
  static TextStyle headlineMedium(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!;
  static TextStyle headlineSmall(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall!;
  static TextStyle titleLarge(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!;
  static TextStyle titleMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!;
  static TextStyle titleSmall(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!;
  static TextStyle bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!;
  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;
  static TextStyle bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;
  static TextStyle labelLarge(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge!;
  static TextStyle labelMedium(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium!;
  static TextStyle labelSmall(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall!;
}
