import 'package:flutter/material.dart';

/// Centralized design tokens for colors, typography, spacing, and radii.
class DesignSystem {
  // Font weights (aliases for convenience)
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Colors — brand
  static const Color primaryCyan = Color(0xFF20A4F3);
  static const Color primaryCyanLight = Color(0xFF4CB8FF);
  static const Color primaryCyanDark = Color(0xFF1890DB);

  // Colors — backgrounds
  static const Color backgroundDark = Color(0xFF0A0A0A);
  static const Color backgroundDarkElevated = Color(0xFF141414);
  static const Color backgroundDarkCard = Color(0xFF1A1A1A);
  static const Color backgroundDarkHover = Color(0xFF202020);

  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundLightElevated = Color(0xFFF8F9FA);
  static const Color backgroundLightCard = Color(0xFFFFFFFF);
  static const Color backgroundLightHover = Color(0xFFF5F5F5);

  // Colors — text
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB4B4B4);
  static const Color textTertiaryDark = Color(0xFF6E6E6E);
  static const Color textDisabledDark = Color(0xFF4A4A4A);

  static const Color textPrimaryLight = Color(0xFF0A0A0A);
  static const Color textSecondaryLight = Color(0xFF6E6E6E);
  static const Color textTertiaryLight = Color(0xFF999999);
  static const Color textDisabledLight = Color(0xFFBBBBBB);

  // Colors — borders
  static const Color borderDark = Color(0xFF2A2A2A);
  static const Color borderDarkSubtle = Color(0xFF333333);
  static const Color borderLight = Color(0xFFE5E5E5);

  // Colors — icons
  static const Color iconDark = Color(0xFFB4B4B4);
  static const Color iconLight = Color(0xFF6E6E6E);

  // Colors — semantic
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryCyan, primaryCyanLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Spacing (4px base scale)
  static const double spacing2 = 2;
  static const double spacing4 = 4;
  static const double spacing6 = 6;
  static const double spacing8 = 8;
  static const double spacing12 = 12;
  static const double spacing16 = 16;
  static const double spacing20 = 20;
  static const double spacing24 = 24;
  static const double spacing32 = 32;
  static const double spacing40 = 40;
  static const double spacing48 = 48;
  static const double spacing64 = 64;

  // Border radius
  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(Radius.circular(8));
  static const BorderRadius borderRadiusMedium =
      BorderRadius.all(Radius.circular(12));
  static const BorderRadius borderRadiusLarge =
      BorderRadius.all(Radius.circular(16));
  static const BorderRadius borderRadiusXLarge =
      BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadiusFull =
      BorderRadius.all(Radius.circular(999));

  // Legacy radius aliases (for existing usages)
  static const BorderRadius radiusSmall = borderRadiusSmall;
  static const BorderRadius radiusMedium = borderRadiusMedium;
  static const BorderRadius radiusLarge = borderRadiusLarge;
  static const BorderRadius radiusXLarge = borderRadiusXLarge;

  // Icon sizes
  static const double iconSizeMedium = 20;

  // Durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 250);
  static const Duration durationSlow = Duration(milliseconds: 350);

  // Typography
  static const String _fontFamily = 'SF Pro Display';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.3,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: -0.2,
  );

  static const TextStyle headingLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: -0.1,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle headingSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle captionSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle label = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.1,
  );
}
