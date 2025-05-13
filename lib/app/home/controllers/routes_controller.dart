import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';

class LoadRoutesCommand implements AsyncListCommand<void, Route> {
  @override
  Future<List<Route>> execute(_) {
    return di.get<ApiService>().fetchRoutes();
  }
}

class RoutesListStore extends ListStore<void, Route> {
  RoutesListStore() : super(LoadRoutesCommand());
}

class LoadRoutesByPlaceIdCommand implements AsyncListCommand<void, Route> {
  final int placeId;
  LoadRoutesByPlaceIdCommand(this.placeId);

  @override
  Future<List<Route>> execute(_) {
    return di.get<ApiService>().fetchRoutes(placeId: placeId);
  }
}

class RoutesByPlaceListStore extends ListStore<void, Route> {
  RoutesByPlaceListStore(int placeId) : super(LoadRoutesByPlaceIdCommand(placeId));
}
