import 'package:flutter/material.dart';

import 'app/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext ontext) {

    final ThemeData gastuCardTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF333333),        // Charcoal Gray
        onPrimary: Colors.white,
        secondary: Color(0xFFD4AF37),      // Light Gold Accent
        onSecondary: Colors.white,
        surface: Color(0xFFF0F0F0),
        onSurface: Color(0xFF333333),
        error: Color(0xFFE57373),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: Color(0xFFFAFAFA),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        foregroundColor: Color(0xFF333333),
        centerTitle: true,
      ),
      cardTheme: CardTheme(
        color: Color(0xFFF0F0F0),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Color(0xFF333333),
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          color: Color(0xFF888888),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFD4AF37),
        foregroundColor: Colors.white,
      ),
      dividerColor: Color(0xFFE0E0E0),
      useMaterial3: true,
    );


    return MaterialApp.router(
      title: 'Gastu Card',
      theme: gastuCardTheme,
      routerConfig: AppRouter.router,
    );
  }
}