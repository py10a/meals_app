import 'package:flutter/material.dart';

import '../widgets/filter_switch.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFreeChosen = false;
  bool _isLactoseFreeChosen = false;
  bool _isVeganChosen = false;
  bool _isVegetarianChosen = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFreeChosen = widget.currentFilters[Filter.glutenFree]!;
    _isLactoseFreeChosen = widget.currentFilters[Filter.lactoseFree]!;
    _isVeganChosen = widget.currentFilters[Filter.vegan]!;
    _isVegetarianChosen = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFreeChosen,
            Filter.lactoseFree: _isLactoseFreeChosen,
            Filter.vegetarian: _isVeganChosen,
            Filter.vegan: _isVegetarianChosen,
          });
        },
        child: Column(
          children: [
            FilterSwitch(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              value: _isGlutenFreeChosen,
              onChanged: (newValue) {
                setState(() {
                  _isGlutenFreeChosen = newValue;
                });
              },
            ),
            FilterSwitch(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: _isLactoseFreeChosen,
              onChanged: (newValue) {
                setState(() {
                  _isLactoseFreeChosen = newValue;
                });
              },
            ),
            FilterSwitch(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              value: _isVeganChosen,
              onChanged: (newValue) {
                setState(() {
                  _isVeganChosen = newValue;
                });
              },
            ),
            FilterSwitch(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: _isVegetarianChosen,
              onChanged: (newValue) {
                setState(() {
                  _isVegetarianChosen = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
