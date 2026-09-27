import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
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
  late Color primaryContainer;
  late Color secondaryContainer;
  late Color tertiaryContainer;
  late Color errorContainer;

  TextStyle get titleLarge => GoogleFonts.getFont('Inter', fontWeight: FontWeight.w500, fontSize: 22);
  TextStyle get titleMedium => GoogleFonts.getFont('Inter', fontWeight: FontWeight.w500, fontSize: 18);
  TextStyle get titleSmall => GoogleFonts.getFont('Inter', fontWeight: FontWeight.w500, fontSize: 16);
  TextStyle get bodyLarge => GoogleFonts.getFont('Inter', fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get bodyMedium => GoogleFonts.getFont('Inter', fontWeight: FontWeight.normal, fontSize: 14);
  TextStyle get bodySmall => GoogleFonts.getFont('Inter', fontWeight: FontWeight.normal, fontSize: 12);
  TextStyle get labelLarge => GoogleFonts.getFont('Inter', fontWeight: FontWeight.normal, fontSize: 16);
  TextStyle get labelMedium => GoogleFonts.getFont('Inter', fontWeight: FontWeight.normal, fontSize: 14);
  TextStyle get labelSmall => GoogleFonts.getFont('Inter', fontWeight: FontWeight.normal, fontSize: 12);
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
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    double? lineHeight,
  }) {
    return useGoogleFonts
        ? GoogleFonts.getFont(
            fontFamily ?? 'Inter',
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            height: lineHeight,
          )
        : copyWith(
            fontFamily: fontFamily,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            height: lineHeight,
          );
  }
}
