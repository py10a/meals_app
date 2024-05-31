import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';

/// Provides helper methods for showing snackbars.
///
/// This class is abstract and should be extended by classes that implement the [showSnackbar] method.
abstract class SnackbarHelper {
  const SnackbarHelper({
    required this.context,
    required this.ref,
  });

  /// The build context in which the snackbar will be shown.
  final BuildContext context;

  /// The [WidgetRef] used to read providers.
  final WidgetRef ref;

  /// Shows a snackbar.
  ///
  /// This method should be overridden by subclasses.
  void showSnackbar() {}
}

/// A [SnackbarHelper] that shows a snackbar when a meal is added to favorites.
class FavoritesAddedSnackbar extends SnackbarHelper {
  /// Creates a new instance of [FavoritesAddedSnackbar].
  ///
  /// The [context], [ref], and [meal] arguments are required.
  FavoritesAddedSnackbar({
    required super.context,
    required super.ref,
    required this.meal,
  });

  /// The meal that was added to favorites.
  final Meal meal;

  /// Shows a snackbar indicating whether the meal was added to or removed from favorites.
  ///
  /// The snackbar includes an 'Undo' action that toggles the favorite status of the meal.
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
