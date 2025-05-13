// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String get url => throw _privateConstructorUsedError;
  int get pk => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get short_description => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  String? get main_image => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get working_hours_from => throw _privateConstructorUsedError;
  String? get working_hours_until => throw _privateConstructorUsedError;
  String? get audio => throw _privateConstructorUsedError;
  String? get audio_transcript => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {String url,
      int pk,
      String name,
      String? description,
      String? short_description,
      Category? category,
      City? city,
      String? main_image,
      Location location,
      String address,
      String? working_hours_from,
      String? working_hours_until,
      String? audio,
      String? audio_transcript,
      List<String>? images});

  $CategoryCopyWith<$Res>? get category;
  $CityCopyWith<$Res>? get city;
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? pk = null,
    Object? name = null,
    Object? description = freezed,
    Object? short_description = freezed,
    Object? category = freezed,
    Object? city = freezed,
    Object? main_image = freezed,
    Object? location = null,
    Object? address = null,
    Object? working_hours_from = freezed,
    Object? working_hours_until = freezed,
    Object? audio = freezed,
    Object? audio_transcript = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      short_description: freezed == short_description
          ? _value.short_description
          : short_description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      main_image: freezed == main_image
          ? _value.main_image
          : main_image // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      working_hours_from: freezed == working_hours_from
          ? _value.working_hours_from
          : working_hours_from // ignore: cast_nullable_to_non_nullable
              as String?,
      working_hours_until: freezed == working_hours_until
          ? _value.working_hours_until
          : working_hours_until // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_transcript: freezed == audio_transcript
          ? _value.audio_transcript
          : audio_transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      int pk,
      String name,
      String? description,
      String? short_description,
      Category? category,
      City? city,
      String? main_image,
      Location location,
      String address,
      String? working_hours_from,
      String? working_hours_until,
      String? audio,
      String? audio_transcript,
      List<String>? images});

  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $CityCopyWith<$Res>? get city;
  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? pk = null,
    Object? name = null,
    Object? description = freezed,
    Object? short_description = freezed,
    Object? category = freezed,
    Object? city = freezed,
    Object? main_image = freezed,
    Object? location = null,
    Object? address = null,
    Object? working_hours_from = freezed,
    Object? working_hours_until = freezed,
    Object? audio = freezed,
    Object? audio_transcript = freezed,
    Object? images = freezed,
  }) {
    return _then(_$PlaceImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      short_description: freezed == short_description
          ? _value.short_description
          : short_description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      main_image: freezed == main_image
          ? _value.main_image
          : main_image // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      working_hours_from: freezed == working_hours_from
          ? _value.working_hours_from
          : working_hours_from // ignore: cast_nullable_to_non_nullable
              as String?,
      working_hours_until: freezed == working_hours_until
          ? _value.working_hours_until
          : working_hours_until // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_transcript: freezed == audio_transcript
          ? _value.audio_transcript
          : audio_transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl extends _Place with DiagnosticableTreeMixin {
  const _$PlaceImpl(
      {required this.url,
      required this.pk,
      required this.name,
      this.description,
      this.short_description,
      this.category,
      this.city,
      this.main_image,
      required this.location,
      required this.address,
      this.working_hours_from,
      this.working_hours_until,
      this.audio,
      this.audio_transcript,
      final List<String>? images})
      : _images = images,
        super._();

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String url;
  @override
  final int pk;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? short_description;
  @override
  final Category? category;
  @override
  final City? city;
  @override
  final String? main_image;
  @override
  final Location location;
  @override
  final String address;
  @override
  final String? working_hours_from;
  @override
  final String? working_hours_until;
  @override
  final String? audio;
  @override
  final String? audio_transcript;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Place(url: $url, pk: $pk, name: $name, description: $description, short_description: $short_description, category: $category, city: $city, main_image: $main_image, location: $location, address: $address, working_hours_from: $working_hours_from, working_hours_until: $working_hours_until, audio: $audio, audio_transcript: $audio_transcript, images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Place'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('pk', pk))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('short_description', short_description))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('main_image', main_image))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('working_hours_from', working_hours_from))
      ..add(DiagnosticsProperty('working_hours_until', working_hours_until))
      ..add(DiagnosticsProperty('audio', audio))
      ..add(DiagnosticsProperty('audio_transcript', audio_transcript))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.pk, pk) || other.pk == pk) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.short_description, short_description) ||
                other.short_description == short_description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.main_image, main_image) ||
                other.main_image == main_image) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.working_hours_from, working_hours_from) ||
                other.working_hours_from == working_hours_from) &&
            (identical(other.working_hours_until, working_hours_until) ||
                other.working_hours_until == working_hours_until) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.audio_transcript, audio_transcript) ||
                other.audio_transcript == audio_transcript) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      pk,
      name,
      description,
      short_description,
      category,
      city,
      main_image,
      location,
      address,
      working_hours_from,
      working_hours_until,
      audio,
      audio_transcript,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place extends Place {
  const factory _Place(
      {required final String url,
      required final int pk,
      required final String name,
      final String? description,
      final String? short_description,
      final Category? category,
      final City? city,
      final String? main_image,
      required final Location location,
      required final String address,
      final String? working_hours_from,
      final String? working_hours_until,
      final String? audio,
      final String? audio_transcript,
      final List<String>? images}) = _$PlaceImpl;
  const _Place._() : super._();

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String get url;
  @override
  int get pk;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get short_description;
  @override
  Category? get category;
  @override
  City? get city;
  @override
  String? get main_image;
  @override
  Location get location;
  @override
  String get address;
  @override
  String? get working_hours_from;
  @override
  String? get working_hours_until;
  @override
  String? get audio;
  @override
  String? get audio_transcript;
  @override
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
