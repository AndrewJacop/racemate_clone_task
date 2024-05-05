import 'package:flutter/material.dart';
import 'package:racemate_clone_task/constants/colors.dart';

class RaceMateThemes {
  static final theme = ThemeData.light().copyWith(
    // ===== Text ===== //
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 28,
          color: RaceMateColors.blue06,
          fontWeight: FontWeight.w900),
      displayMedium: TextStyle(
          fontSize: 24,
          color: RaceMateColors.blue06,
          fontWeight: FontWeight.w900),
      displaySmall: TextStyle(
          fontSize: 22,
          color: RaceMateColors.blue06,
          fontWeight: FontWeight.w900),
      headlineMedium: TextStyle(
          fontSize: 18,
          color: RaceMateColors.blue06,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: 16,
          color: RaceMateColors.blue06,
          fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 14, color: RaceMateColors.blue06),
      titleMedium: TextStyle(fontSize: 16, color: RaceMateColors.blue06),
      titleSmall: TextStyle(fontSize: 16, color: RaceMateColors.blue06),
      bodyLarge: TextStyle(fontSize: 16, color: RaceMateColors.blue06),
      bodyMedium: TextStyle(fontSize: 14, color: RaceMateColors.blue06),
      labelLarge: TextStyle(fontSize: 20, color: RaceMateColors.blue06),
    ),
    // ===== Buttons ===== //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            const MaterialStatePropertyAll(RaceMateColors.yellow01),
        foregroundColor: const MaterialStatePropertyAll(RaceMateColors.blue06),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    // ===== Search View ===== //
    searchViewTheme: const SearchViewThemeData(
      constraints: BoxConstraints(maxHeight: 500, minHeight: 100),
      dividerColor: RaceMateColors.yellow01,
      surfaceTintColor: RaceMateColors.blue00,
      shape: BeveledRectangleBorder(
        side: BorderSide(color: RaceMateColors.yellow01, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );
}
