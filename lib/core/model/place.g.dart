// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      url: json['url'] as String,
      pk: json['pk'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      short_description: json['short_description'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      main_image: json['main_image'] as String?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] as String,
      working_hours_from: json['working_hours_from'] as String?,
      working_hours_until: json['working_hours_until'] as String?,
      audio: json['audio'] as String?,
      audio_transcript: json['audio_transcript'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'pk': instance.pk,
      'name': instance.name,
      'description': instance.description,
      'short_description': instance.short_description,
      'category': instance.category?.toJson(),
      'city': instance.city?.toJson(),
      'main_image': instance.main_image,
      'location': instance.location.toJson(),
      'address': instance.address,
      'working_hours_from': instance.working_hours_from,
      'working_hours_until': instance.working_hours_until,
      'audio': instance.audio,
      'audio_transcript': instance.audio_transcript,
      'images': instance.images,
    };
