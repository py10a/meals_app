/// Enum representing the complexity of a meal.
enum Complexity {
  simple,
  challenging,
  hard,
}

/// Enum representing the affordability of a meal.
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

/// Represents a meal in the application.
///
/// - Each meal has a unique [id]
/// - A list of [categories]
/// - A [title]
/// - An [imageUrl]
/// - A list of [ingredients]
/// - A list of [steps]
/// - A [duration]
/// - A [complexity]
/// - An [affordability]
/// - Flags for dietary restrictions ([isGlutenFree], [isLactoseFree], [isVegan], [isVegetarian])
class Meal {
  /// Creates a new meal.
  ///
  /// All arguments are required.
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  /// The unique identifier for this meal.
  final String id;

  /// The categories this meal belongs to.
  final List<String> categories;

  /// The title of this meal.
  final String title;

  /// The URL of an image representing this meal.
  final String imageUrl;

  /// The ingredients needed to prepare this meal.
  final List<String> ingredients;

  /// The steps to follow to prepare this meal.
  final List<String> steps;

  /// The duration, in minutes, to prepare this meal.
  final int duration;

  /// The complexity of preparing this meal.
  final Complexity complexity;

  /// The affordability of this meal.
  final Affordability affordability;

  /// Whether this meal is gluten-free.
  final bool isGlutenFree;

  /// Whether this meal is lactose-free.
  final bool isLactoseFree;

  /// Whether this meal is vegan.
  final bool isVegan;

  /// Whether this meal is vegetarian.
  final bool isVegetarian;
}
