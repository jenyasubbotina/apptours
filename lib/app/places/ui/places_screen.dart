import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:apptours/app/home/controllers/categories_controller.dart';
import 'package:apptours/app/home/controllers/places_controller.dart';
import 'package:apptours/core/model/place.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/place_category.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/core/ui/place_item.dart';
import 'package:apptours/main.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final _store = di.get<PlacesListStore>();
  final categoriesStore = CategoriesListStore();

  final List<int> selectedCategoriesIds = [];
  List<Place> get filteredPlaces => selectedCategoriesIds.isEmpty
      ? _store.data
      : _store.data.where((place) => selectedCategoriesIds.contains(place.category?.pk)).toList();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store.load(null);
    categoriesStore.load(null);
  }

  void _updateFilter(int id) {
    setState(() {
      selectedCategoriesIds.contains(id) ? selectedCategoriesIds.remove(id) : selectedCategoriesIds.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                s.label_places,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // place categories
            Observer(builder: (context) {
              if (categoriesStore.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (categoriesStore.data.isNotEmpty) {
                return SizedBox(
                  height: 46,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      separatorBuilder: (context, _) => const SizedBox(width: 16),
                      itemCount: categoriesStore.data.length,
                      itemBuilder: (context, index) {
                        final category = categoriesStore.data[index];
                        return PlaceCategory(
                          onPressed: () => _updateFilter(category.pk),
                          category: category,
                          selected: selectedCategoriesIds.contains(category.pk),
                        );
                      }),
                );
              } else {
                return const Text("Empty");
              }
            }),

            const SizedBox(height: 24),
            Observer(builder: (context) {
              if (_store.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_store.data.isNotEmpty) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (context, _) => const SizedBox(height: 20),
                    itemCount: filteredPlaces.length,
                    itemBuilder: (context, index) => SizedBox(
                      // height: 404,
                      width: MediaQuery.sizeOf(context).width,
                      child: PlaceItem(place: filteredPlaces[index]),
                    ),
                  ),
                );
              } else {
                return const Center(child: Text('Empty'));
              }
            }),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
