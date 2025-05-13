import 'package:flutter/cupertino.dart' hide Route;
import 'package:flutter/material.dart' hide Route;

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
import 'package:apptours/app/home/controllers/favs_controller.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/route_item.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/main.dart';

class FavsScreen extends StatefulWidget {
  const FavsScreen({super.key});

  @override
  State<FavsScreen> createState() => _FavsScreenState();
}

class _FavsScreenState extends State<FavsScreen> {
  final _userRepository = di.get<UserRepository>();
  final _store = FavsListStore();

  late final City city;
  @override
  void initState() {
    super.initState();
    _store.load(null);
    _userRepository.getCity().then((value) => city = value!);
  }

  List<Route> get _filteredRoutes => _store.data.where((route) => route.city.pk == city.pk).toList();

  void _onRoutePicked(Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((value) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.route, arguments: value));
  }

  void _onStartRoute(Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((value) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.map, arguments: value));
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    padding: EdgeInsets.zero,
                    iconSize: 24,
                    icon: const Icon(CupertinoIcons.arrow_left, color: AppColors.text),
                  ),
                  Expanded(
                    child: Text(
                      s.label_saved_tours,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            Observer(builder: (context) {
              if (_store.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_filteredRoutes.isNotEmpty) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (context, _) => const SizedBox(height: 20),
                    itemCount: _filteredRoutes.length,
                    itemBuilder: (context, index) {
                      final route = _filteredRoutes[index];
                      return GestureDetector(
                        onTap: () {
                          _onRoutePicked(route);
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: RouteItem(
                            route: route,
                            showStartButton: false,
                            onStartRoute: () => _onStartRoute(route),
                          ),
                        ),
                      );
                    },
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
