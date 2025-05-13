// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
      url: json['url'] as String,
      pk: json['pk'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      duration_fast: json['duration_fast'] as String,
      duration_slow: json['duration_slow'] as String,
      difficulty: json['difficulty'] as int,
      length: json['length'] as int,
      image: json['image'] as String,
      gpx_file: json['gpx_file'] as String?,
      liked: json['liked'] as bool,
      likes_count: json['likes_count'] as int,
      gpx_data: json['gpx_data'] == null
          ? null
          : GpxData.fromJson(json['gpx_data'] as Map<String, dynamic>),
      places: (json['places'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'pk': instance.pk,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city.toJson(),
      'duration_fast': instance.duration_fast,
      'duration_slow': instance.duration_slow,
      'difficulty': instance.difficulty,
      'length': instance.length,
      'image': instance.image,
      'gpx_file': instance.gpx_file,
      'liked': instance.liked,
      'likes_count': instance.likes_count,
      'gpx_data': instance.gpx_data?.toJson(),
      'places': instance.places?.map((e) => e.toJson()).toList(),
    };
