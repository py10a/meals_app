import 'package:flutter/material.dart';
import 'package:meals_app/data/mock_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  // Pass filtered meals to child class (i.e. CategoryGridItem)
  void _onSelectCategory(BuildContext context, Category category) {
    List<Meal> filtered = meals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(
            title: category.title,
            meals: filtered,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: <CategoryGridItem>[
          for (final Category category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _onSelectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
