import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'segment.freezed.dart';
part 'segment.g.dart';

@freezed
class Segment with _$Segment {
  const factory Segment({
    required List<List<double>> points,
  }) = _Segment;

  const Segment._();

  factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);
}