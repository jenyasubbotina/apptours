// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SegmentImpl _$$SegmentImplFromJson(Map<String, dynamic> json) =>
    _$SegmentImpl(
      points: (json['points'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$SegmentImplToJson(_$SegmentImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
    };
