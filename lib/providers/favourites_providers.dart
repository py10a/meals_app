import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealsNotifier() : super([]); // Init empty favourites screen.

  bool toggleMealFavouriteStatus(Meal meal) {
    final isMealFavourite = state.contains(meal);
    state = isMealFavourite
        ? state.where((m) => m.id != meal.id).toList()
        : state = [...state, meal];
    return !isMealFavourite;
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesMealsNotifier, List<Meal>>((ref) {
  return FavouritesMealsNotifier();
});
