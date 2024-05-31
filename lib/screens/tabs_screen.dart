import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int currentScreenIndex = 0; // Categories screen index for bottom navbar.

  void _onTapBottomNavigationBarItem(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(favouritesProvider);
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget currentScreen = currentScreenIndex == 0
        ? CategoriesScreen(meals: filteredMeals)
        : MealsScreen(meals: favourites);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentScreenIndex == 0
            ? 'Pick your meal category'
            : 'Your favourites'),
      ),
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          _setScreen(identifier);
        },
      ),
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
