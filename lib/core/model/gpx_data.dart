import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apptours/core/model/track.dart';

part 'gpx_data.freezed.dart';
part 'gpx_data.g.dart';

@freezed
class GpxData with _$GpxData {
  const factory GpxData({
    required List<Track> tracks,
  }) = _GpxData;

  const GpxData._();

  factory GpxData.fromJson(Map<String, dynamic> json) => _$GpxDataFromJson(json);
}
