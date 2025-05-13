import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/preferences.dart';

class UserRepository {
  final _prefs = Preferences.current;

  void setUserId(int id) => _prefs.setInt('userId', id);
  void setUserName(String name) => _prefs.setString('userName', name);
  void setUserEmail(String email) => _prefs.setString('userEmail', email);

  Future<int?> getUserId() => _prefs.getInt('userId');
  Future<String?> getUserName() => _prefs.getString('userName');
  Future<String?> getUserEmail() => _prefs.getString('userEmail');

  void setCity(City city) {
    _prefs.setInt('cityId', city.pk);
    _prefs.setString('cityName', city.name);
    _prefs.setString('cityUrl', city.url);
    _prefs.setString('cityImage', city.image);
  }

  Future<City?> getCity() async {
    final id = await _prefs.getInt('cityId');
    final name = await _prefs.getString('cityName');
    final url = await _prefs.getString('cityUrl');
    final image = await _prefs.getString('cityImage');
    if (id != null && name != null && url != null && image != null) {
      return City(url: url, pk: id, name: name, image: image);
    } else {
      return null;
    }
  }

  void logout() {
    _prefs.removeKey('userId');

    _prefs.removeKey('cityId');
    _prefs.removeKey('cityName');
    _prefs.removeKey('cityUrl');
    _prefs.removeKey('cityImage');
  }
}
