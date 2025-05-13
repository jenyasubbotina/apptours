import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/place.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';

class LoadSinglePlaceCommand implements AsyncCommand<int, Place> {
  @override
  Future<Place> execute(int placeId) {
    return di.get<ApiService>().fetchPlaceById(id: placeId);
  }
}

class SinglePlaceStore extends ItemStore<int, Place> {
  SinglePlaceStore() : super(LoadSinglePlaceCommand());

  @override
  bool get canReload => true;
}
