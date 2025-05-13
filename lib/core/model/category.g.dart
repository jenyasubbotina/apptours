// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      url: json['url'] as String,
      pk: json['pk'] as int,
      name: json['name'] as String,
      text_color: json['text_color'] as String?,
      bg_color: json['bg_color'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'pk': instance.pk,
      'name': instance.name,
      'text_color': instance.text_color,
      'bg_color': instance.bg_color,
    };
