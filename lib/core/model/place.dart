import 'package:flutter/foundation.dart' hide Category;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/model/location.dart';
import 'package:apptours/core/model/category.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String url,
    required int pk,
    required String name,
    String? description,
    String? short_description,
    Category? category,
    City? city,
    String? main_image,
    required Location location,
    required String address,
    String? working_hours_from,
    String? working_hours_until,
    String? audio,
    String? audio_transcript,
    List<String>? images,
  }) = _Place;

  const Place._();

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
