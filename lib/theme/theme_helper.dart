import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray50,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimaryContainer.withOpacity(0.16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.h),
              topRight: Radius.circular(0.h),
              bottomLeft: Radius.circular(0.h),
              bottomRight: Radius.circular(16.h),
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray30001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray20001,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 16.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 12.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 34.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 32.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 13.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 10.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 20.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray90002,
          fontSize: 16.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFC67C4E),
    primaryContainer: Color(0XFF292D32),
    secondaryContainer: Color(0XFF35C07D),

    // Error colors
    errorContainer: Color(0XFF2F4B4E),
    onError: Color(0XFF7F7F7F),
    onErrorContainer: Color(0XFFFFFFFF),

    // On colors(text colors)
    onPrimary: Color(0XFF131313),
    onPrimaryContainer: Color(0X00000000),
    onSecondaryContainer: Color(0XFF1C1C1C),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // BlueGray
  Color get blueGray400 => Color(0XFF8D8D8D);
  Color get blueGray50 => Color(0XFFF1F1F1);
  Color get blueGray900 => Color(0XFF2E2D2C);
  Color get blueGray90001 => Color(0XFF313131);
  Color get blueGray90002 => Color(0XFF2F2D2C);
  Color get blueGray90003 => Color(0XFF303336);

  // Gray
  Color get gray100 => Color(0XFFF3F3F3);
  Color get gray10001 => Color(0XFFF4F4F4);
  Color get gray10002 => Color(0XFFF6F6F6);
  Color get gray200 => Color(0XFFEFEFEF);
  Color get gray20001 => Color(0XFFEAEAEA);
  Color get gray300 => Color(0XFFDDDDDD);
  Color get gray30001 => Color(0XFFDEDEDE);
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray500 => Color(0XFF9B9B9B);
  Color get gray50001 => Color(0XFFA8A8A8);
  Color get gray50002 => Color(0XFF979797);
  Color get gray50003 => Color(0XFFAAADB0);
  Color get gray800 => Color(0XFF494040);
  Color get gray900 => Color(0XFF130F26);

  // Grayf
  Color get gray3003f => Color(0X3FE4E4E4);
  Color get gray4003f => Color(0X3FB8B8B8);

  // Red
  Color get red400 => Color(0XFFED5151);
  Color get red50 => Color(0XFFFFF4EE);
  Color get red500 => Color(0XFFEA4335);
  Color get red5001 => Color(0XFFFFF0F0);

  // Yellow
  Color get yellow700 => Color(0XFFFABD21);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();