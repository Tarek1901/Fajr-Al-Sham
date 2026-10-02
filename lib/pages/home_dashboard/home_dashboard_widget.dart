import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static ThemeMode themeMode = ThemeMode.light;

  static Future<void> initialize() async {
    themeMode = ThemeMode.light;
  }

  static Future<void> saveThemeMode(ThemeMode mode) async {
    themeMode = mode;
  }

  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;

  late Color primaryText;
  late Color secondaryText;

  late Color primaryBackground;
  late Color secondaryBackground;

  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;

  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color onPrimary;
  late Color onSecondary;
  late Color onTertiary;
  late Color onError;
  
  // المتغيرات المضافة حديثاً لتجنب الأخطاء
  late Color onPrimary70;
  late Color surfaceVariant;
  late Color surfaceVariant30;

  late Color primaryContainer;
  late Color secondaryContainer;
  late Color tertiaryContainer;
  late Color errorContainer;

  // Text Styles
  TextStyle get displayLarge => GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 57);
  TextStyle get displayMedium => GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 45);
  TextStyle get displaySmall => GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 36);
  TextStyle get headlineLarge => GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 32);
  TextStyle get headlineMedium => GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 28);
  TextStyle get headlineSmall => GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 24);
  TextStyle get titleLarge => GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 22);
  TextStyle get titleMedium => GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 18);
  TextStyle get titleSmall => GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16);
  TextStyle get bodyLarge => GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get bodyMedium => GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 14);
  TextStyle get bodySmall => GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 12);
  TextStyle get labelLarge => GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get labelMedium => GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 14);
  TextStyle get labelSmall => GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 12);
}

class LightModeTheme extends FlutterFlowTheme {
  @override
  Color primary = const Color(0xFF4B39EF);
  @override
  Color secondary = const Color(0xFF39D2C0);
  @override
  Color tertiary = const Color(0xFFEE8B60);
  @override
  Color alternate = const Color(0xFFE0E3E7);
  @override
  Color primaryText = const Color(0xFF14181B);
  @override
  Color secondaryText = const Color(0xFF57636C);
  @override
  Color primaryBackground = const Color(0xFFF1F4F8);
  @override
  Color secondaryBackground = const Color(0xFFFFFFFF);
  @override
  Color accent1 = const Color(0x4C4B39EF);
  @override
  Color accent2 = const Color(0x4D39D2C0);
  @override
  Color accent3 = const Color(0x4DEE8B60);
  @override
  Color accent4 = const Color(0xCCFFFFFF);
  @override
  Color success = const Color(0xFF24A891);
  @override
  Color warning = const Color(0xFFFCDC0C);
  @override
  Color error = const Color(0xFFFF5963);
  @override
  Color info = const Color(0xFFFFFFFF);
  @override
  Color onPrimary = const Color(0xFFFFFFFF);
  @override
  Color onSecondary = const Color(0xFFFFFFFF);
  @override
  Color onTertiary = const Color(0xFFFFFFFF);
  @override
  Color onError = const Color(0xFFFFFFFF);
  
  @override
  Color onPrimary70 = const Color(0xB3FFFFFF); // لون جديد تمت إضافته
  @override
  Color surfaceVariant = const Color(0xFFE1E2EC);
  @override
  Color surfaceVariant30 = const Color(0x4DE1E2EC);

  @override
  Color primaryContainer = const Color(0xFF4B39EF);
  @override
  Color secondaryContainer = const Color(0xFF39D2C0);
  @override
  Color tertiaryContainer = const Color(0xFFEE8B60);
  @override
  Color errorContainer = const Color(0xFFFF5963);
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
    double? letterSpacing,
  }) {
    TextStyle result = font ?? this;
    if (useGoogleFonts && font == null && fontFamily != null) {
      result = GoogleFonts.getFont(
        fontFamily,
        color: result.color,
        fontSize: result.fontSize,
        fontWeight: result.fontWeight,
        fontStyle: result.fontStyle,
        height: result.height,
        letterSpacing: result.letterSpacing,
      );
    }
    return result.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: lineHeight,
      letterSpacing: letterSpacing,
    );
  }
}
