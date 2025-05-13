import 'package:flutter/material.dart' hide Route;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:apptours/app/auth/ui/auth_screen.dart';
import 'package:apptours/app/home/ui/home_screen.dart';
import 'package:apptours/app/main/ui/main_screen.dart';
import 'package:apptours/app/places/ui/place_screen.dart';
import 'package:apptours/app/places/ui/places_screen.dart';
import 'package:apptours/app/profile/ui/favs_screen.dart';
import 'package:apptours/app/profile/ui/profile_screen.dart';
import 'package:apptours/app/register/register_screen.dart';
import 'package:apptours/app/routes/ui/route_screen.dart';
import 'package:apptours/app/routes/ui/routes_screen.dart';
import 'package:apptours/app/home/ui/choose_city_home_screen.dart';
import 'package:apptours/core/model/place.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/map/map_screen.dart';
import 'package:apptours/generated/l10n.dart';

abstract class AppRoute {
  static const String auth = '/auth';
  static const String register = '/register';
  static const String main = '/main';
  static const String chooseCity = '/chooseCity';
  static const String home = '/home';
  static const String routes = '/routes';
  static const String route = '/route';
  static const String favs = '/favs';
  static const String places = '/places';
  static const String place = '/place';
  static const String profile = '/profile';
  static const String map = '/map';
}

class AppToursApp extends StatefulWidget {
  static final routeObserver = RouteObserver<ModalRoute<void>>();

  const AppToursApp({Key? key}) : super(key: key);

  @override
  State<AppToursApp> createState() => _AppToursAppState();
}

class _AppToursAppState extends State<AppToursApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => S.of(context).app_title,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        // Locale('ru'),
      ],
      navigatorObservers: [
        AppToursApp.routeObserver,
      ],
      theme: SilkroadTheme().create(),
      home: const AuthScreen(),
      onGenerateRoute: (settings) {
        final route = settings.name;
        switch (route) {
          case AppRoute.favs:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const FavsScreen(),
            );
          case AppRoute.auth:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const AuthScreen(),
            );
          case AppRoute.register:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const RegisterScreen(),
            );
          case AppRoute.main:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const MainScreen(),
            );
          case AppRoute.chooseCity:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const ChooseCityHomeScreen(),
            );
          case AppRoute.home:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const HomeScreen(),
            );
          case AppRoute.routes:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const RoutesScreen(),
            );
          case AppRoute.route:
            final route = settings.arguments as Route;
            return AppPageRoute(
              settings: settings,
              builder: (_) => RouteScreen(route: route),
            );
          case AppRoute.places:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const PlacesScreen(),
            );
          case AppRoute.place:
            final args = settings.arguments as List<Object>;
            final place = args[0] as Place;
            final canPop = args[1] as bool?;
            return AppPageRoute(
              settings: settings,
              builder: (_) => PlaceScreen(
                place: place,
                canBackToRoute: canPop ?? false,
              ),
            );
          case AppRoute.profile:
            return AppPageRoute(
              settings: settings,
              builder: (_) => const ProfileScreen(),
            );
          case AppRoute.map:
            final route = settings.arguments as Route;
            return AppPageRoute(
              settings: settings,
              builder: (_) => MapScreen(route: route),
            );
          default:
            throw Exception('No screen for route $route}');
        }
      },
    );
  }
}

class MessagePageRoute<T> extends MaterialPageRoute<T> {
  MessagePageRoute(Widget content) : super(builder: (_) => content, fullscreenDialog: true);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return const FadeUpwardsPageTransitionsBuilder()
        .buildTransitions(this, context, animation, secondaryAnimation, child);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}

class AppPageRoute<T> extends MaterialPageRoute<T> {
  final _dialogTransitionBuilder = const ZoomPageTransitionsBuilder();

  AppPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool batteryObserver = true,
  }) : super(
          settings: settings,
          fullscreenDialog: fullscreenDialog,
          builder: (context) {
            final screen = builder(context);
            return screen;
          },
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (fullscreenDialog) {
      return _dialogTransitionBuilder.buildTransitions(this, context, animation, secondaryAnimation, child);
    }
    return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}
