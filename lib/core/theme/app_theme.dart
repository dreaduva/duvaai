import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color seedColor = Colors.green;
  static final TextTheme baseTextTheme = GoogleFonts.montserratTextTheme();

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
    appBarTheme: const AppBarTheme(
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
    appBarTheme: const AppBarTheme(
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
  static Color primaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.primaryContainer;
  static Color onPrimaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimaryContainer;
  static Color primaryFixed(BuildContext context) =>
      Theme.of(context).colorScheme.primaryFixed;
  static Color primaryFixedDim(BuildContext context) =>
      Theme.of(context).colorScheme.primaryFixedDim;
  static Color onPrimaryFixed(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimaryFixed;
  static Color onPrimaryFixedVariant(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimaryFixedVariant;

  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static Color onSecondary(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondary;
  static Color secondaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.secondaryContainer;
  static Color onSecondaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondaryContainer;
  static Color secondaryFixed(BuildContext context) =>
      Theme.of(context).colorScheme.secondaryFixed;
  static Color secondaryFixedDim(BuildContext context) =>
      Theme.of(context).colorScheme.secondaryFixedDim;
  static Color onSecondaryFixed(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondaryFixed;
  static Color onSecondaryFixedVariant(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondaryFixedVariant;

  static Color tertiary(BuildContext context) =>
      Theme.of(context).colorScheme.tertiary;
  static Color onTertiary(BuildContext context) =>
      Theme.of(context).colorScheme.onTertiary;
  static Color tertiaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.tertiaryContainer;
  static Color onTertiaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.onTertiaryContainer;
  static Color tertiaryFixed(BuildContext context) =>
      Theme.of(context).colorScheme.tertiaryFixed;
  static Color tertiaryFixedDim(BuildContext context) =>
      Theme.of(context).colorScheme.tertiaryFixedDim;
  static Color onTertiaryFixed(BuildContext context) =>
      Theme.of(context).colorScheme.onTertiaryFixed;
  static Color onTertiaryFixedVariant(BuildContext context) =>
      Theme.of(context).colorScheme.onTertiaryFixedVariant;

  static Color error(BuildContext context) =>
      Theme.of(context).colorScheme.error;
  static Color onError(BuildContext context) =>
      Theme.of(context).colorScheme.onError;
  static Color errorContainer(BuildContext context) =>
      Theme.of(context).colorScheme.errorContainer;
  static Color onErrorContainer(BuildContext context) =>
      Theme.of(context).colorScheme.onErrorContainer;

  static Color surface(BuildContext context) =>
      Theme.of(context).colorScheme.surface;
  static Color onSurface(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;
  static Color onSurfaceVariant(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;
  static Color inverseSurface(BuildContext context) =>
      Theme.of(context).colorScheme.inverseSurface;
  static Color onInverseSurface(BuildContext context) =>
      Theme.of(context).colorScheme.onInverseSurface;

  static Color outline(BuildContext context) =>
      Theme.of(context).colorScheme.outline;
  static Color outlineVariant(BuildContext context) =>
      Theme.of(context).colorScheme.outlineVariant;
  static Color shadow(BuildContext context) =>
      Theme.of(context).colorScheme.shadow;
  static Color scrim(BuildContext context) =>
      Theme.of(context).colorScheme.scrim;
  static Color surfaceTint(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceTint;

  static Color inversePrimary(BuildContext context) =>
      Theme.of(context).colorScheme.inversePrimary;

  static Color surfaceBright(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceBright;
  static Color surfaceContainerLowest(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerLowest;
  static Color surfaceContainerLow(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerLow;
  static Color surfaceContainer(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainer;
  static Color surfaceContainerHigh(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerHigh;
  static Color surfaceContainerHighest(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerHighest;
  static Color surfaceDim(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceDim;

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
