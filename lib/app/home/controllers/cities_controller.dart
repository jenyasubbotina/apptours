import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';


class LoadCitiesCommand implements AsyncListCommand<void, City> {
  @override
  Future<List<City>> execute(_) {
    return di.get<ApiService>().fetchCities();
  }
}

class CitiesListStore extends ListStore<void, City> {
  CitiesListStore() : super(LoadCitiesCommand());
}
