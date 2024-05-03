import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';

abstract class SnackbarHelper {
  const SnackbarHelper({
    required this.context,
    required this.ref,
  });

  final BuildContext context;
  final WidgetRef ref;

  void showSnackbar() {}
}

class FavoritesAddedSnackbar extends SnackbarHelper {
  FavoritesAddedSnackbar({
    required super.context,
    required super.ref,
    required this.meal,
  });

  final Meal meal;

  @override
  void showSnackbar() {
    final isAddedToFavourites =
        ref.read(favouritesProvider.notifier).toggleMealFavouriteStatus(meal);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              ref
                  .read(favouritesProvider.notifier)
                  .toggleMealFavouriteStatus(meal);
            }),
        content: Text(
          isAddedToFavourites
              ? 'Meal is favourite.'
              : 'Meal is no longer favourite.',
        ),
      ),
    );
  }
}

void showSnackbar(String? option1, String? option2) {}
