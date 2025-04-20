// coverage:ignore-file
import 'package:firestore_posts/app/ui/ui.dart';
import 'package:flutter/material.dart';

/// Contains the light theme used in App.
abstract class AppTheme {
  /// Returns the light theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Roboto',
      splashColor: Colors.transparent,
      shadowColor: const Color.fromRGBO(228, 235, 252, 0.25),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        surface: AppColors.surfaceColor,
        secondary: AppColors.secondaryColor,
        primary: AppColors.primaryColor,
      ),
    );
  }
}
