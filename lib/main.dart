import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/splash_screen/splash_screen.dart';
import 'package:social_app/values/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Social App',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: appBackgroundColorDark,
          primaryColor: appPrimaryColorDark,
          colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColorDark),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
          ),
        ),
        theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: appBackgroundColorLight,
          primaryColor: appPrimaryColorLight,
          colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColorLight),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
