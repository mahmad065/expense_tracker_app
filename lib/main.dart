import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/expenses_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kDarkColorScheme.onPrimaryContainer,
        foregroundColor: kDarkColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondary,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            labelMedium: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
            ),
            labelMedium: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
    ),
    home: const ExpensesScreen(),
  ));
}
