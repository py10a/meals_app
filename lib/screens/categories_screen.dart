import 'package:flutter/material.dart';
import 'package:meals_app/data/mock_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your meal category'),
      ),
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
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
