import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';

class LoadFavsCommand implements AsyncListCommand<void, Route> {
  @override
  Future<List<Route>> execute(_) {
    return di.get<ApiService>().fetchFavs();
  }
}

class FavsListStore extends ListStore<void, Route> {
  FavsListStore() : super(LoadFavsCommand());
}
