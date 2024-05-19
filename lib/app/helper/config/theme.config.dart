import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primarySeedColor = Color(0xFF6CA450);
const Color secondarySeedColor = Color(0xFF3871BB);
const Color tertiarySeedColor = Color(0xFF6CA450);
const Color primary = Color(0xFFF8F7F7);
const Color onPrimary = Color(0xFF1E1E1E);

final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
  // primary: primary,
  // onPrimary: onPrimary,
  tones: FlexTones.vivid(Brightness.light),
);

final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primarySeedColor,
  secondaryKey: secondarySeedColor,
  tertiaryKey: tertiarySeedColor,
  // primary: primary,
  // onPrimary: onPrimary,
  tones: FlexTones.vivid(Brightness.dark),
);

// theme: AppTheme1.appTheme,
// darkTheme: AppTheme1.darkTheme,
class AppTheme1 with ChangeNotifier {
  static ThemeData get appTheme {
    var baseTheme = ThemeData(brightness: Brightness.light);
    return ThemeData.from(
      colorScheme: schemeLight,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      // useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    var baseTheme = ThemeData(brightness: Brightness.dark);
    return ThemeData.from(
      colorScheme: schemeDark,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      // useMaterial3: true,
    );
  }
}

// theme: AppTheme1.appTheme(context),
// darkTheme: AppTheme1.darkTheme(context),
class AppTheme2 with ChangeNotifier {
  static ThemeData appTheme(BuildContext context) {
    var baseTheme = ThemeData(brightness: Brightness.light);
    return ThemeData.from(
      colorScheme: schemeLight,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      // useMaterial3: true,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    var baseTheme = ThemeData(brightness: Brightness.dark);
    return ThemeData.from(
      colorScheme: schemeDark,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      // useMaterial3: true,
    );
  }
}

// theme: AppThemes.lightTheme(lightColorScheme),
// darkTheme: AppThemes.darkTheme(darkColorScheme),
class AppTheme3 {
  static ThemeData lightTheme(ColorScheme? lightColorScheme) {
    var baseTheme = ThemeData(brightness: Brightness.light);
    ColorScheme scheme = lightColorScheme ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFFF47C7C),
          brightness: Brightness.light,
        );
    return ThemeData(
      colorScheme: scheme,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }

  static ThemeData darkTheme(ColorScheme? darkColorScheme) {
    var baseTheme = ThemeData(brightness: Brightness.dark);
    ColorScheme scheme = darkColorScheme ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFFF47C7C),
          brightness: Brightness.dark,
        );
    return ThemeData(
      colorScheme: scheme,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
