import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
import 'package:apptours/app/home/controllers/routes_controller.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/ui/route_item.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/assets/assets.gen.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/core/model/route.dart' as silkRoad;
import 'package:apptours/main.dart';

import '../../main/ui/apptours.dart';
import '../controllers/single_route_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _store = di.get<RoutesListStore>();
  final _userRepository = di.get<UserRepository>();
  City? _city;
  @override
  void initState() {
    super.initState();
    _store.load(null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userRepository.getCity().then((city) => setState(() => _city = city));
    });
  }

  void _onRoutePicked(silkRoad.Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((value) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.route, arguments: value));
  }

  void _onStartRoute(silkRoad.Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((value) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.map, arguments: value));
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(builder: (context) {
                final child = Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: Navigator.of(context).pop,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        iconSize: 24,
                        icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _city?.name ?? '',
                        textAlign: TextAlign.start,
                        softWrap: false,
                        style: const TextStyle(
                          color: AppColors.light,
                          fontWeight: FontWeight.w800,
                          fontSize: 66,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    image: _city == null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Assets.images.tashkentBackground.path),
                          )
                        : DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(_city!.image),
                          ),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black.withOpacity(.74), Colors.transparent],
                        ),
                      ),
                      child: child),
                );
              }),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      s.label_best_tours,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Observer(builder: (context) {
                    if (_store.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (_store.data.isNotEmpty) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        separatorBuilder: (context, _) => const SizedBox(height: 20),
                        itemCount: _store.data.length,
                        itemBuilder: (context, index) {
                          final route = _store.data[index];
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
                      );
                    } else {
                      return const Center(child: Text('Empty'));
                    }
                  }),
                  const SizedBox(height: 48),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
