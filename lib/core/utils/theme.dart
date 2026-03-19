import 'package:flutter/material.dart';

/// Design tokens — même palette que le web admin
class AppColors {
  AppColors._();

  // Backgrounds
  static const bgDeep    = Color(0xFF0B1219);
  static const bgPanel   = Color(0xFF0F1923);
  static const bgSurface = Color(0xFF162230);
  static const bgCard    = Color(0xFF1A2A3A);

  // Accent doré
  static const accent    = Color(0xFFD4A853);
  static const accentDim = Color(0x1FD4A853); // 12 %

  // Texte
  static const textPrimary   = Color(0xFFEDF2F7);
  static const textSecondary = Color(0xFF7A8EA8);
  static const textMuted     = Color(0xFF3D5166);

  // Bordure
  static const border = Color(0x12FFFFFF);

  // Sémantiques
  static const green      = Color(0xFF4ADE80);
  static const greenDim   = Color(0x1A4ADE80);
  static const blue       = Color(0xFF60A5FA);
  static const blueDim    = Color(0x1A60A5FA);
  static const warning    = Color(0xFFFBBF24);
  static const warningDim = Color(0x1AFBBF24);
  static const error      = Color(0xFFF87171);
  static const errorDim   = Color(0x14F87171);
}

class AppTextStyles {
  AppTextStyles._();

  static const _base = TextStyle(
    fontFamily: 'DMSans',
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );

  static final displayLg = _base.copyWith(
    fontFamily: 'DMSerifDisplay',
    fontSize: 32,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w400,
  );

  static final displaySm = _base.copyWith(
    fontFamily: 'DMSerifDisplay',
    fontSize: 24,
    letterSpacing: -0.3,
    fontWeight: FontWeight.w400,
  );

  static final headingLg = _base.copyWith(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -0.3);
  static final headingMd = _base.copyWith(fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: -0.2);
  static final headingSm = _base.copyWith(fontSize: 15, fontWeight: FontWeight.w600);

  static final bodyLg  = _base.copyWith(fontSize: 15, fontWeight: FontWeight.w400, height: 1.55);
  static final bodyMd  = _base.copyWith(fontSize: 13, fontWeight: FontWeight.w400, height: 1.5);
  static final bodySm  = _base.copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.45);

  static final labelLg = _base.copyWith(fontSize: 13, fontWeight: FontWeight.w500);
  static final labelMd = _base.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
  static final labelSm = _base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.08,
    color: AppColors.textMuted,
  );

  static final eyebrow = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.accent,
  );
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgDeep,
    colorScheme: const ColorScheme.dark(
      primary:   AppColors.accent,
      secondary: AppColors.blue,
      error:     AppColors.error,
      surface:   AppColors.bgPanel,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bgPanel,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'DMSans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    ),

    // BottomNav
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgPanel,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.textMuted,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        fontFamily: 'DMSans', fontSize: 10, fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'DMSans', fontSize: 10,
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.bgPanel,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border),
      ),
    ),

    // Input
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bgSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      hintStyle: const TextStyle(
        fontFamily: 'DMSans', fontSize: 14, color: AppColors.textMuted,
      ),
      labelStyle: const TextStyle(
        fontFamily: 'DMSans', fontSize: 14, color: AppColors.textSecondary,
      ),
    ),

    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.bgDeep,
        elevation: 0,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontFamily: 'DMSans', fontSize: 15, fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // OutlinedButton
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accent,
        side: const BorderSide(color: AppColors.accent),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontFamily: 'DMSans', fontSize: 15, fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // TextButton
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accent,
        textStyle: const TextStyle(
          fontFamily: 'DMSans', fontSize: 14, fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Chip
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.bgSurface,
      selectedColor: AppColors.accentDim,
      labelStyle: const TextStyle(
        fontFamily: 'DMSans', fontSize: 13, color: AppColors.textSecondary,
      ),
      side: const BorderSide(color: AppColors.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 0,
    ),

    fontFamily: 'DMSans',
  );
}
