import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apptours/core/model/segment.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const factory Track({
    required String name,
    String? description,
    required List<Segment> segments,
  }) = _Track;

  const Track._();

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
