import 'package:flutter/material.dart';
import 'package:meals_app/themes/app_theme.dart';

// Entry-point method of the app.
void main() {
  runApp(
    const MealsApp(),
  );
}

// Main class of the app.
class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Placeholder(
          child: Text('TODO'), // TODO: Create main page of the app.
        ),
      ),
    );
  }
}
