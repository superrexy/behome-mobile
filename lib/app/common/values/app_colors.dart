import 'package:flutter/material.dart';

abstract class AppColors {
  static MaterialColor primaryColor = const MaterialColor(0xFF476F99, {
    50: Color(0xFFF6F8FA),
    100: Color(0xFFEDF1F5),
    200: Color(0xFFD1DBE6),
    300: Color(0xFFB4C4D6),
    400: Color(0xFF7F9BB8),
    500: Color(0xFF476F99),
    600: Color(0xFF406389),
    700: Color(0xFF2B435C),
    800: Color(0xFF203245),
    900: Color(0xFF15212D),
  });

  static MaterialColor secondaryColor = const MaterialColor(0xFF031F3D, {
    50: Color(0xFFF3F4F6),
    100: Color(0xFFE6E9EC),
    200: Color(0xFFC0C7CF),
    300: Color(0xFF98A4B0),
    400: Color(0xFF4F6378),
    500: Color(0xFF031F3D),
    600: Color(0xFF031C37),
    700: Color(0xFF021325),
    800: Color(0xFF020E1C),
    900: Color(0xFF010912),
  });

  static MaterialColor tertiaryColor = const MaterialColor(0xFFD9D9D9, {
    50: Color(0xFFFEFEFE),
    100: Color(0xFFFCFCFC),
    200: Color(0xFFF6F6F6),
    300: Color(0xFFF0F0F0),
    400: Color(0xFFE5E5E5),
    500: Color(0xFFD9D9D9),
    600: Color(0xFFC2C2C2),
    700: Color(0xFF838383),
    800: Color(0xFF626262),
    900: Color(0xFF3F3F3F),
  });
}
