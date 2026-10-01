import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static ThemeMode themeMode = ThemeMode.system;

  static Future<void> initialize() async {
    // No persistent theme storage required for APK build.
  }

  static void saveThemeMode(ThemeMode mode) {
    themeMode = mode;
  }

  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  Color get primary;
  Color get secondary;
  Color get tertiary;
  Color get alternate;
  Color get primaryText;
  Color get secondaryText;
  Color get primaryBackground;
  Color get secondaryBackground;
  Color get accent1;
  Color get accent2;
  Color get accent3;
  Color get accent4;
  Color get success;
  Color get warning;
  Color get error;
  Color get info;

  Color get onPrimary;
  Color get onSecondary;
  Color get onTertiary;
  Color get onError;
  Color get primaryContainer;
  Color get secondaryContainer;
  Color get tertiaryContainer;
  Color get errorContainer;

  TextStyle get displayLarge =>
      GoogleFonts.inter(fontSize: 57, fontWeight: FontWeight.w400);

  TextStyle get displayMedium =>
      GoogleFonts.inter(fontSize: 45, fontWeight: FontWeight.w400);

  TextStyle get displaySmall =>
      GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w400);

  TextStyle get headlineLarge =>
      GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w500);

  TextStyle get headlineMedium =>
      GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w500);

  TextStyle get headlineSmall =>
      GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500);

  TextStyle get titleLarge =>
      GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w500);

  TextStyle get titleMedium =>
      GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500);

  TextStyle get titleSmall =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get bodyLarge =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get bodyMedium =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get bodySmall =>
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);

  TextStyle get labelLarge =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get labelMedium =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get labelSmall =>
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);
}

class LightModeTheme extends FlutterFlowTheme {
  @override
  Color get primary => const Color(0xFF4B39EF);

  @override
  Color get secondary => const Color(0xFF39D2C0);

  @override
  Color get tertiary => const Color(0xFFEE8B60);

  @override
  Color get alternate => const Color(0xFFE0E3E7);

  @override
  Color get primaryText => const Color(0xFF14181B);

  @override
  Color get secondaryText => const Color(0xFF57636C);

  @override
  Color get primaryBackground => const Color(0xFFF1F4F8);

  @override
  Color get secondaryBackground => const Color(0xFFFFFFFF);

  @override
  Color get accent1 => const Color(0x4C4B39EF);

  @override
  Color get accent2 => const Color(0x4D39D2C0);

  @override
  Color get accent3 => const Color(0x4DEE8B60);

  @override
  Color get accent4 => const Color(0xCCFFFFFF);

  @override
  Color get success => const Color(0xFF24A891);

  @override
  Color get warning => const Color(0xFFFCDC0C);

  @override
  Color get error => const Color(0xFFFF5963);

  @override
  Color get info => const Color(0xFFFFFFFF);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onSecondary => const Color(0xFFFFFFFF);

  @override
  Color get onTertiary => const Color(0xFFFFFFFF);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get primaryContainer => const Color(0xFF4B39EF);

  @override
  Color get secondaryContainer => const Color(0xFF39D2C0);

  @override
  Color get tertiaryContainer => const Color(0xFFEE8B60);

  @override
  Color get errorContainer => const Color(0xFFFF5963);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    double? lineHeight,
  }) {
    final base = font ?? this;

    if (useGoogleFonts && font == null) {
      return GoogleFonts.getFont(
        fontFamily ?? 'Inter',
        color: color ?? base.color,
        fontSize: fontSize ?? base.fontSize,
        fontWeight: fontWeight ?? base.fontWeight,
        fontStyle: fontStyle ?? base.fontStyle,
        height: lineHeight ?? base.height,
      );
    }

    return base.copyWith(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: lineHeight,
    );
  }
}
