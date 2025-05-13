import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/model/place.dart';

import 'gpx_data.dart';

part 'route.freezed.dart';
part 'route.g.dart';

enum Difficulty {
  @JsonValue('VeryEasy')
  veryEasy,
  @JsonValue('Easy')
  easy,
  @JsonValue('Medium')
  medium,
  @JsonValue('Hard')
  hard,
  @JsonValue('Extreme')
  extreme,
}

@freezed
class Route with _$Route {
  const factory Route({
    required String url,
    required int pk,
    required String name,
    required String description,
    required City city,
    required String duration_fast,
    required String duration_slow,
    required int difficulty,
    required int length,
    required String image,
    String? gpx_file,
    required bool liked,
    required int likes_count,
    GpxData? gpx_data,
    List<Place>? places,
  }) = _Route;

  const Route._();

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}
