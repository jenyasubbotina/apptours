import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City {
  const factory City({
    required String url,
    required int pk,
    required String name,
    required String image,
  }) = _City;

  // const City._();

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
