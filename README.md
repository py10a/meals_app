# Meals App - README

## Overview
Meals App is a mobile application designed to provide culinary inspiration to cooking enthusiasts worldwide. The app offers a rich database of recipes from various cuisines, enabling users to explore new flavors and improve their cooking skills.

## Main Objectives
- **Provide Diverse Recipes:** A comprehensive database of recipes from various world cuisines.
- **Step-by-Step Instructions:** Detailed, illustrated instructions for each recipe.
- **Personalization:** Users can create profiles, save favorite recipes, and create shopping lists.
- **Community:** Enable users to share recipes, reviews, and cooking tips.

## Target Audience
- Cooking enthusiasts
- Families looking for healthy and tasty meals
- Individuals with specific dietary needs

## Vision and Mission
- **Vision:** Create a global platform for culinary exploration and enjoyment.
- **Mission:** Provide high-quality, reliable, and inspiring culinary recipes accessible to everyone.

## Future Extensions
- Integration with meal planners
- Online shopping for ingredients
- Collaboration with renowned chefs
- Interactive AR cooking lessons

## Solution
Meals App is built using Flutter for its efficiency, shared codebase, and quick UI development capabilities. The project structure includes several key directories and files:

- **/lib:** Contains the main application code in Dart.
    - **/data:** Stores application data like mock data for meals and categories.
    - **/models:** Defines data models for meals and categories.
    - **/providers:** Manages global state using Riverpod.
    - **/helpers:** Contains utility functions and classes.
    - **/themes:** Defines the application themes.
    - **/widgets:** Custom widgets for the app.
    - **/screens:** Screens for various parts of the app.
    - **main.dart:** Entry point of the application.

## Application Design (UX/UI)
- **Color Schemes:** Harmonious and attractive color combinations.
- **Font Pairs:** Readable and aesthetically pleasing fonts.
- **Composition:** Balanced layout for intuitive navigation and usage.

## Functionality
The app comprises five main screens:
1. **TabsScreen (CategoryScreen) + Drawer:** Main screen with recipe categories.
2. **MealsScreen:** Displays meals in the selected category.
3. **DetailedMealScreen:** Shows detailed information about a selected meal.
4. **TabsScreen (Your Favorites):** Lists user's favorite meals.
5. **FiltersScreen:** Allows users to apply dietary filters.
