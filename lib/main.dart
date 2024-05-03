import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/themes/app_theme.dart';

/// The main function that is the entry point of the application.
///
/// This function calls the [runApp] function provided by the Flutter SDK
/// and passes an instance of the [MealsApp] widget to it.
void main() {
  runApp(const MealsApp());
}

/// The root widget of the application.
class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// The [ProviderScope] widget is used to create a new scope in the widget tree where Providers and Consumers could be used.
    return ProviderScope(
      /// The root of the widget tree and includes global settings for the application .
      child: MaterialApp(
        title: 'Meals',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const TabsScreen(),
      ),
    );
  }
}
