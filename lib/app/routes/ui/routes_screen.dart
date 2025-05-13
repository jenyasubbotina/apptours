import 'package:flutter/material.dart' hide Route;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:apptours/app/home/controllers/single_route_controller.dart';
import 'package:apptours/core/ui/route_item.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/main.dart';

import '../../../core/services/api_service.dart';
import '../../home/controllers/routes_controller.dart';
import '../../main/ui/apptours.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  final _listStore = di.get<RoutesListStore>();
  final _singleStore = SingleRouteListStore();

  @override
  void initState() {
    super.initState();
    _listStore.load(null);
  }

  void _onRoutePicked(Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((route) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.route, arguments: route));
  }

  void _onStartRoute(Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((route) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.map, arguments: route));
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      s.label_tours,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Observer(builder: (context) {
                    if (_listStore.isLoading || _singleStore.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_listStore.data.isNotEmpty) {
                      return Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          separatorBuilder: (context, _) => const SizedBox(height: 20),
                          itemCount: _listStore.data.length,
                          itemBuilder: (context, index) {
                            final route = _listStore.data[index];
                            return GestureDetector(
                              onTap: () {
                                _onRoutePicked(route);
                              },
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: RouteItem(
                                  route: route,
                                  showStartButton: true,
                                  onStartRoute: () {
                                    _onStartRoute(route);
                                  },
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
            )
          ],
        ),
      ),
    );
  }
}
