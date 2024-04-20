import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentScreenIndex = 0; // Categories screen.

  void _onTapBottomNavigationBarItem(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentScreenIndex == 0
        ? const CategoriesScreen()
        : const MealsScreen(meals: []);

    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapBottomNavigationBarItem,
        currentIndex: currentScreenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Meals'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
