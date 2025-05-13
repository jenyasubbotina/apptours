import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String url,
    required int pk,
    required String name,
    String? text_color,
    String? bg_color,
  }) = _Category;

  const Category._();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
