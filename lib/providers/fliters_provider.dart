import 'package:flutter_riverpod/legacy.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier(Map<Filter, bool> state) : super({
    Filter.glutenFree: state[Filter.glutenFree] ?? false,
    Filter.lactoseFree: state[Filter.lactoseFree] ?? false,
    Filter.vegetarian: state[Filter.vegetarian] ?? false,
    Filter.vegan: state[Filter.vegan] ?? false,
  });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier({});
});