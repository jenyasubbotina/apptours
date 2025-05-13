// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpx_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GpxDataImpl _$$GpxDataImplFromJson(Map<String, dynamic> json) =>
    _$GpxDataImpl(
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GpxDataImplToJson(_$GpxDataImpl instance) =>
    <String, dynamic>{
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
    };
