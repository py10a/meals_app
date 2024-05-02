import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

import '../widgets/filter_switch.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        children: [
          FilterSwitch(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            value: filters[Filter.glutenFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilter(Filter.glutenFree, newValue);
            },
          ),
          FilterSwitch(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            value: filters[Filter.lactoseFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilter(Filter.lactoseFree, newValue);
            },
          ),
          FilterSwitch(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            value: filters[Filter.vegetarian]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilter(Filter.vegetarian, newValue);
            },
          ),
          FilterSwitch(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            value: filters[Filter.vegan]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .toggleFilter(Filter.vegan, newValue);
            },
          ),
        ],
      ),
    );
  }
}
