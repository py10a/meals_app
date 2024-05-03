import 'package:flutter/material.dart'; // imported for [Colors] class.

/// Represents a meal category in the application.
///
/// Each category has a unique [id], a [title], and a [color] that defaults to orange.
class Category {
  /// Creates a new category.
  ///
  /// The [id] and [title] arguments are required. The [color] argument is optional and defaults to orange.
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  /// The unique identifier for this category.
  final String id;

  /// The title of this category.
  final String title;

  /// The color associated with this category. Defaults to orange if not specified.
  final Color color;
}
