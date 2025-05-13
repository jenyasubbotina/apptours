import 'package:flutter/cupertino.dart' hide CupertinoTabBar, CupertinoTabScaffold;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apptours/app/home/ui/choose_city_home_screen.dart';
import 'package:apptours/app/home/ui/home_screen.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/app/places/ui/places_screen.dart';
import 'package:apptours/app/profile/ui/profile_screen.dart';
import 'package:apptours/app/routes/ui/routes_screen.dart';
import 'package:apptours/core/ui/custom_cupertino_tab_bar.dart';
import 'package:apptours/core/ui/custom_cupertino_tab_scaffold.dart';
import 'package:apptours/generated/assets/assets.gen.dart';
import 'package:apptours/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// GlobalKey<ScaffoldState> bottomTabBarScaffoldKey = GlobalKey();
//
// final GlobalKey<NavigatorState> mainPageTabNavKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> catalogScreenTabNavKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> authUserTabNavKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> basketTabNavKey = GlobalKey<NavigatorState>();

CustomCupertinoTabController tabController = CustomCupertinoTabController(initialIndex: 0);

class _MainScreenState extends State<MainScreen> {
  // final listOfGlobalKeys = [mainPageTabNavKey, catalogScreenTabNavKey, authUserTabNavKey, basketTabNavKey];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: CupertinoTabScaffold(
        // key: bottomTabBarScaffoldKey,
        resizeToAvoidBottomInset: false,
        controller: tabController,
        tabBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            // if (index == _currentIndex) {
            //   listOfGlobalKeys[index].currentState?.popUntil((route) => route.isFirst);
            // }
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset(Assets.icons.homeSelected.path)
                  : SvgPicture.asset(Assets.icons.home.path),
              label: s.label_home,
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset(Assets.icons.pointerSelected.path)
                  : SvgPicture.asset(Assets.icons.pointer.path),
              label: s.label_tours,
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset(Assets.icons.markerSelected.path)
                  : SvgPicture.asset(Assets.icons.marker.path),
              label: s.label_places,
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset(Assets.icons.profileSelected.path)
                  : SvgPicture.asset(Assets.icons.profile.path),
              label: s.label_profile,
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            // navigatorKey: listOfGlobalKeys[index],
            onGenerateRoute: (settings) {
              final route = settings.name;
              switch (route) {
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
                case AppRoute.places:
                  return AppPageRoute(
                    settings: settings,
                    builder: (_) => const PlacesScreen(),
                  );
                case AppRoute.profile:
                  return AppPageRoute(
                    settings: settings,
                    builder: (_) => const ProfileScreen(),
                  );
                default:
                  throw Exception('No screen for route $route}');
              }
            },
            builder: (context) {
              return SafeArea(
                top: false,
                bottom: false,
                child: CupertinoPageScaffold(
                  resizeToAvoidBottomInset: false,
                  child: switch (index) {
                    0 => const ChooseCityHomeScreen(),
                    1 => const RoutesScreen(),
                    2 => const PlacesScreen(),
                    3 => const ProfileScreen(),
                    _ => const Placeholder(),
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
