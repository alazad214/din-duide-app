import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF1455AC),
  brightness: Brightness.dark,
  highlightColor: const Color(0xFF252525),
  hintColor: const Color(0xFFc7c7c7),
  cardColor: const Color(0xFF242424),
  scaffoldBackgroundColor: AppColors.cWhite,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF1455AC),
    secondary: Color(0xFF78BDFC),
    tertiary: Color(0xFF865C0A),
    tertiaryContainer: Color(0xFF6C7A8E),
    surface: Color(0xFF2D2D2D),
    onPrimary: Color(0xFFB7D7FE),
    onTertiaryContainer: Color(0xFF0F5835),
    primaryContainer: Color(0xFF208458),
    onSecondaryContainer: Color(0x912A2A2A),
    outline: Color(0xff2C66B4),
    onTertiary: Color(0xFF545252),
    secondaryContainer: Color(0xFFF2F2F2),
  ),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Color(0xFFE9EEF4))),

  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    },
  ),
);
