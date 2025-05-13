import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
import 'package:apptours/app/home/controllers/places_controller.dart';
import 'package:apptours/app/home/controllers/restaurants_controller.dart';
import 'package:apptours/app/home/controllers/routes_controller.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/preferences.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/services/http_service.dart';

final di = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  initDi();

  runApp(const AppToursApp());
}

void initDi() {
  di
    ..registerSingleton(Preferences())
    ..registerSingleton(UserRepository())
    ..registerSingleton(PlacesListStore())
    ..registerSingleton(RoutesListStore())
    ..registerSingleton(RestaurantsListStore())
    ..registerSingleton(Logger())
    ..registerSingleton(HttpService())
    ..registerSingleton(ApiService());
}
