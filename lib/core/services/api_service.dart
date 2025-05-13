import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
import 'package:apptours/core/model/category.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/model/place.dart';
import 'package:apptours/core/model/profile_support_data.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/model/user.dart';
import 'package:apptours/core/preferences.dart';
import 'package:apptours/core/services/http_service.dart';
import 'package:apptours/main.dart';

class ApiService {
  final _log = di.get<Logger>();
  final _httpService = di.get<HttpService>();
  final _userRepository = di.get<UserRepository>();

  Future<ProfileSupportData> fetchProfileData() async {
    try {
      final staticData = await _httpService.getHttp(
        route: 'api/static-data',
      );
      _log.i('static Data $staticData');
      _log.i(staticData);
      return ProfileSupportData.fromJson(staticData as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Route>> fetchRoutes({int? placeId}) async {
    try {
      final city = await _userRepository.getCity();
      final param = placeId != null
          ? '?places=$placeId'
          : city != null
              ? '?city=${city.pk}'
              : '';
      final routesData = (await _httpService.getHttp(
        route: 'api/tours/routes/$param',
      ) as Map<String, dynamic>)['results'] as List<dynamic>;
      _log.i('routes Data $routesData');

      final routesList = <Route>[];
      for (final route in routesData) {
        routesList.add(Route.fromJson(route as Map<String, dynamic>));
      }
      return routesList;
    } catch (e) {
      _log.e(e);
      rethrow;
    }
  }

  Future<List<Route>> fetchFavs() async {
    try {
      final userId = await _userRepository.getUserId();
      final routesData = (await _httpService.getHttp(route: 'api/tours/routes/liked_routes', headers: {
        'User-Id': userId,
      }) as Map<String, dynamic>)['results'] as List<dynamic>;
      _log.i('favs routes Data $routesData');

      final routesList = <Route>[];
      for (final route in routesData) {
        routesList.add(Route.fromJson(route as Map<String, dynamic>));
      }
      return routesList;
    } catch (e) {
      _log.e(e);
      rethrow;
    }
  }

  Future<Route> fetchRouteById({
    required int id,
  }) async {
    try {
      final routeData = await _httpService.getHttp(
        route: 'api/tours/routes/$id/',
      );
      _log.i('route Data $routeData');
      _log.i(routeData as Map<String, dynamic>);
      return Route.fromJson(routeData);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateLikedRoute({
    required int id,
    required bool liked,
  }) async {
    try {
      final routeData = await _httpService.patchHttp(route: 'api/tours/routes/$id/', body: {
        'liked': liked,
      }) as Map<String, dynamic>;
      _log.i('route Data $routeData');
      _log.i(routeData);
      return routeData['liked'] as bool;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Place>> fetchPlaces() async {
    try {
      final city = await _userRepository.getCity();
      final placesData = (await _httpService.getHttp(
        route: 'api/tours/places/${city != null ? '?city=${city.pk}' : ''}',
      ) as Map<String, dynamic>)['results'] as List<dynamic>;
      _log.i('places Data $placesData');

      final placesList = <Place>[];
      for (final place in placesData) {
        placesList.add(Place.fromJson(place as Map<String, dynamic>));
      }
      return placesList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Place>> fetchRestaurants() async {
    try {
      final city = await _userRepository.getCity();
      final placesData = (await _httpService.getHttp(
        route: 'api/tours/places/?category=5&${city != null ? 'city=${city.pk}' : ''}',
      ) as Map<String, dynamic>)['results'] as List<dynamic>;
      _log.i('places Data $placesData');

      final placesList = <Place>[];
      for (final place in placesData) {
        placesList.add(Place.fromJson(place as Map<String, dynamic>));
      }
      return placesList;
    } catch (e) {
      rethrow;
    }
  }

  Future<Place> fetchPlaceById({
    required int id,
  }) async {
    try {
      final placeData = await _httpService.getHttp(
        route: 'api/tours/places/$id/',
      );
      _log.i('place Data $placeData');

      return Place.fromJson(placeData as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final categoriesData = await _httpService.getHttp(
        route: 'api/tours/placecategories/',
      ) as List<dynamic>;
      _log.i('categories Data $categoriesData');

      final categoriesList = <Category>[];
      for (final category in categoriesData) {
        categoriesList.add(Category.fromJson(category as Map<String, dynamic>));
      }
      return categoriesList;
    } catch (e) {
      rethrow;
    }
  }

  Future<Category> fetchCategoryById({
    required String id,
  }) async {
    try {
      final categoryData = await _httpService.getHttp(
        route: 'api/tours/placecategories/$id/',
      );
      _log.i('category Data $categoryData');

      return Category.fromJson(categoryData as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<City>> fetchCities() async {
    try {
      final citiesData = await _httpService.getHttp(
        route: 'api/tours/cities/',
      ) as List<dynamic>;
      _log.i('cities Data $citiesData');

      final citiesList = <City>[];
      for (final city in citiesData) {
        citiesList.add(City.fromJson(city as Map<String, dynamic>));
      }
      return citiesList;
    } catch (e) {
      rethrow;
    }
  }

  Future<City> fetchCityById({
    required String id,
  }) async {
    try {
      final cityData = await _httpService.getHttp(
        route: 'api/tours/cities/$id/',
      );
      _log.i('city Data $cityData');

      return City.fromJson(cityData as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> register({required String email, required String password, required String fullName}) async {
    _log.i('register');
    try {
      final result = await _httpService.postHttp(route: 'auth/', body: {
        'email': email,
        'password': password,
        'full_name': fullName,
      }) as Map<String, dynamic>;

      final userId = result['pk'] as int;
      final userEmail = result['email'] as String;
      final userName = result['full_name'] as String;
      _log.f(userId);

      _userRepository.setUserId(userId);
      _userRepository.setUserEmail(userEmail);
      _userRepository.setUserName(userName);
      return true;
    } on DioError catch (e) {
      final map = e.response?.data as Map<String, dynamic>;
      throw Exception(map['detail']);
    } on Exception {
      rethrow;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    _log.i('login');
    try {
      final result = await _httpService.postHttp(route: 'auth/login/', body: {
        'email': email,
        'password': password,
      }) as Map<String, dynamic>;

      final userId = result['pk'] as int;
      final userEmail = result['email'] as String;
      final userName = result['full_name'] as String;
      _log.f('userId is $userId');

      _userRepository.setUserId(userId);
      _userRepository.setUserEmail(userEmail);
      _userRepository.setUserName(userName);
      return true;
    } on DioError catch (e) {
      final map = e.response?.data as Map<String, dynamic>;
      throw Exception(map['detail']);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> authMe() async {
    _log.i('auth me');
    var id = await _userRepository.getUserId();
    _log.i("userRep $id");
    try {
      final result = await _httpService.getHttp(route: 'auth/me/', headers: {
        'User-Id': id,
      }) as Map<String, dynamic>;
      _log.i("result $result");

      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    _log.i('logout');
    try {
      _userRepository.logout();
      return true;
    } catch (e) {
      return false;
    }
  }
}
