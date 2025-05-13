import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';
import 'package:apptours/core/model/place.dart';

class LoadPlacesCommand implements AsyncListCommand<void, Place> {
  @override
  Future<List<Place>> execute(_) {
    return di.get<ApiService>().fetchRestaurants();
  }
}

class RestaurantsListStore extends ListStore<void, Place> {
  RestaurantsListStore() : super(LoadPlacesCommand());
}
