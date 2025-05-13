import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    required int srid,
  }) = _Location;

  const Location._();

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
