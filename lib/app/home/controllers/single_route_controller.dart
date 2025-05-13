import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';

class LoadSingleRouteCommand implements AsyncCommand<int, Route> {
  @override
  Future<Route> execute(int routeId) {
    return di.get<ApiService>().fetchRouteById(id: routeId);
  }
}

class SingleRouteListStore extends ItemStore<int, Route> {
  SingleRouteListStore() : super(LoadSingleRouteCommand());

  @override
  bool get canReload => true;
}
