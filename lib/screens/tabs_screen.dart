import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites_providers.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

import '../widgets/main_drawer.dart';
import 'filters_screen.dart';

const Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int currentScreenIndex = 0; // Categories screen index for bottom navbar.
  Map<Filter, bool> _selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _onTapBottomNavigationBarItem(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final favourites = ref.watch(favouritesProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget currentScreen = currentScreenIndex == 0
        ? CategoriesScreen(meals: availableMeals)
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
