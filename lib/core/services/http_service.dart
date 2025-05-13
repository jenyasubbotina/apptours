// ignore_for_file: only_throw_errors

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
//import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:apptours/core/preferences.dart';
import 'package:apptours/main.dart';

class HttpService {
  HttpService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          _log.i('path ${options.path}');
          final userId = await _userRepository.getUserId();
          if (userId != null && !options.path.contains('auth')) {
            options.headers['User-Id'] = userId.toString();
          }
          return handler.next(options);
        },
      ),
    );
    // ..add(
    //   DioLoggingInterceptor(
    //     level: Level.body,
    //     compact: false,
    //   ),
    // );
  }

  final _log = di.get<Logger>();
  final _sharedPreferences = di.get<Preferences>();
  final _userRepository = di.get<UserRepository>();
  final _dio = Dio();

  final String _baseUrl = const String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://advantour.showcase.uz/',
  );

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<dynamic> getHttp({
    required String route,
    Map<String, dynamic>? headers,
  }) async {
    _log.i('Sending GET to ${_baseUrl + route}');

    try {
      final response = await _dio.get<dynamic>(
        _baseUrl + route,
        options: Options(
          headers: headers,
          contentType: 'application/json',
        ),
      );
      return response.data;
      // } on DioError catch (e) {
      // if (e.response!.statusCode == 403 &&
      //     e.response!.data.toString().contains('You do not have permission to perform this action')) {
      //   throw const Failure.client(message: 'You are not admin', code: 403);
      // }
      // throw handleFailure(e);
    } on Exception catch (e) {
      _log.e(e);
      throw Exception(e);
    }
  }

  Future<dynamic> putHttp({
    required String route,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    _log.i('Sending PUT to ${_baseUrl + route}');

    try {
      final response = await _dio.put<dynamic>(
        _baseUrl + route,
        data: data,
        options: Options(
          headers: headers,
          contentType: 'application/json',
        ),
      );
      return response.data;
    } on DioError catch (e) {
      _log
        ..e(e)
        ..e(e.response?.statusCode);
    } on Exception catch (e) {
      _log.e(e);
      throw Exception(e);
    }
  }

  Future<dynamic> postHttp({
    required String route,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    Response<dynamic> response;

    _log.i('Sending $body to ${_baseUrl + route}');
    try {
      response = await _dio.post(
        _baseUrl + route,
        data: body,
        options: Options(
          contentType: 'application/json',
          headers: headers,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      _log
        ..e(e)
        ..e(e.response?.statusCode)
        ..e(e.response?.data);
      rethrow;
    } on Exception catch (e) {
      _log.e(e);
      throw Exception(e);
    }
  }

  Future<dynamic> patchHttp({
    required String route,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    Response<dynamic> response;

    _log.i('Sending $body to ${_baseUrl + route}');
    try {
      response = await _dio.patch(
        _baseUrl + route,
        data: body,
        options: Options(
          contentType: 'application/json',
          headers: headers,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      _log
        ..e(e)
        ..e(e.response?.statusCode)
        ..e(e.response?.data);
    } on Exception catch (e) {
      _log.e(e);
      throw Exception(e);
    }
  }

  Future<dynamic> deleteHttp({
    required String route,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    Response<dynamic> response;

    _log.i('Sending DELETE to ${_baseUrl + route}');
    try {
      response = await _dio.delete(
        _baseUrl + route,
        data: body,
        options: Options(
          contentType: 'application/json',
          headers: headers,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      _log
        ..e(e)
        ..e(e.response?.statusCode)
        ..e(e.response?.data);
    } on Exception catch (e) {
      _log.e(e);
      throw Exception(e);
    }
  }
}
