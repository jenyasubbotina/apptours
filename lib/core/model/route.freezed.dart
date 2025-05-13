// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  String get url => throw _privateConstructorUsedError;
  int get pk => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  City get city => throw _privateConstructorUsedError;
  String get duration_fast => throw _privateConstructorUsedError;
  String get duration_slow => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get gpx_file => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  int get likes_count => throw _privateConstructorUsedError;
  GpxData? get gpx_data => throw _privateConstructorUsedError;
  List<Place>? get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call(
      {String url,
      int pk,
      String name,
      String description,
      City city,
      String duration_fast,
      String duration_slow,
      int difficulty,
      int length,
      String image,
      String? gpx_file,
      bool liked,
      int likes_count,
      GpxData? gpx_data,
      List<Place>? places});

  $CityCopyWith<$Res> get city;
  $GpxDataCopyWith<$Res>? get gpx_data;
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

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
    Object? description = null,
    Object? city = null,
    Object? duration_fast = null,
    Object? duration_slow = null,
    Object? difficulty = null,
    Object? length = null,
    Object? image = null,
    Object? gpx_file = freezed,
    Object? liked = null,
    Object? likes_count = null,
    Object? gpx_data = freezed,
    Object? places = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      duration_fast: null == duration_fast
          ? _value.duration_fast
          : duration_fast // ignore: cast_nullable_to_non_nullable
              as String,
      duration_slow: null == duration_slow
          ? _value.duration_slow
          : duration_slow // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      gpx_file: freezed == gpx_file
          ? _value.gpx_file
          : gpx_file // ignore: cast_nullable_to_non_nullable
              as String?,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      likes_count: null == likes_count
          ? _value.likes_count
          : likes_count // ignore: cast_nullable_to_non_nullable
              as int,
      gpx_data: freezed == gpx_data
          ? _value.gpx_data
          : gpx_data // ignore: cast_nullable_to_non_nullable
              as GpxData?,
      places: freezed == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GpxDataCopyWith<$Res>? get gpx_data {
    if (_value.gpx_data == null) {
      return null;
    }

    return $GpxDataCopyWith<$Res>(_value.gpx_data!, (value) {
      return _then(_value.copyWith(gpx_data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteImplCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$RouteImplCopyWith(
          _$RouteImpl value, $Res Function(_$RouteImpl) then) =
      __$$RouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      int pk,
      String name,
      String description,
      City city,
      String duration_fast,
      String duration_slow,
      int difficulty,
      int length,
      String image,
      String? gpx_file,
      bool liked,
      int likes_count,
      GpxData? gpx_data,
      List<Place>? places});

  @override
  $CityCopyWith<$Res> get city;
  @override
  $GpxDataCopyWith<$Res>? get gpx_data;
}

/// @nodoc
class __$$RouteImplCopyWithImpl<$Res>
    extends _$RouteCopyWithImpl<$Res, _$RouteImpl>
    implements _$$RouteImplCopyWith<$Res> {
  __$$RouteImplCopyWithImpl(
      _$RouteImpl _value, $Res Function(_$RouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? pk = null,
    Object? name = null,
    Object? description = null,
    Object? city = null,
    Object? duration_fast = null,
    Object? duration_slow = null,
    Object? difficulty = null,
    Object? length = null,
    Object? image = null,
    Object? gpx_file = freezed,
    Object? liked = null,
    Object? likes_count = null,
    Object? gpx_data = freezed,
    Object? places = freezed,
  }) {
    return _then(_$RouteImpl(
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      duration_fast: null == duration_fast
          ? _value.duration_fast
          : duration_fast // ignore: cast_nullable_to_non_nullable
              as String,
      duration_slow: null == duration_slow
          ? _value.duration_slow
          : duration_slow // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      gpx_file: freezed == gpx_file
          ? _value.gpx_file
          : gpx_file // ignore: cast_nullable_to_non_nullable
              as String?,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      likes_count: null == likes_count
          ? _value.likes_count
          : likes_count // ignore: cast_nullable_to_non_nullable
              as int,
      gpx_data: freezed == gpx_data
          ? _value.gpx_data
          : gpx_data // ignore: cast_nullable_to_non_nullable
              as GpxData?,
      places: freezed == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteImpl extends _Route with DiagnosticableTreeMixin {
  const _$RouteImpl(
      {required this.url,
      required this.pk,
      required this.name,
      required this.description,
      required this.city,
      required this.duration_fast,
      required this.duration_slow,
      required this.difficulty,
      required this.length,
      required this.image,
      this.gpx_file,
      required this.liked,
      required this.likes_count,
      this.gpx_data,
      final List<Place>? places})
      : _places = places,
        super._();

  factory _$RouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteImplFromJson(json);

  @override
  final String url;
  @override
  final int pk;
  @override
  final String name;
  @override
  final String description;
  @override
  final City city;
  @override
  final String duration_fast;
  @override
  final String duration_slow;
  @override
  final int difficulty;
  @override
  final int length;
  @override
  final String image;
  @override
  final String? gpx_file;
  @override
  final bool liked;
  @override
  final int likes_count;
  @override
  final GpxData? gpx_data;
  final List<Place>? _places;
  @override
  List<Place>? get places {
    final value = _places;
    if (value == null) return null;
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Route(url: $url, pk: $pk, name: $name, description: $description, city: $city, duration_fast: $duration_fast, duration_slow: $duration_slow, difficulty: $difficulty, length: $length, image: $image, gpx_file: $gpx_file, liked: $liked, likes_count: $likes_count, gpx_data: $gpx_data, places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Route'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('pk', pk))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('duration_fast', duration_fast))
      ..add(DiagnosticsProperty('duration_slow', duration_slow))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('length', length))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('gpx_file', gpx_file))
      ..add(DiagnosticsProperty('liked', liked))
      ..add(DiagnosticsProperty('likes_count', likes_count))
      ..add(DiagnosticsProperty('gpx_data', gpx_data))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.pk, pk) || other.pk == pk) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.duration_fast, duration_fast) ||
                other.duration_fast == duration_fast) &&
            (identical(other.duration_slow, duration_slow) ||
                other.duration_slow == duration_slow) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.gpx_file, gpx_file) ||
                other.gpx_file == gpx_file) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.likes_count, likes_count) ||
                other.likes_count == likes_count) &&
            (identical(other.gpx_data, gpx_data) ||
                other.gpx_data == gpx_data) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      pk,
      name,
      description,
      city,
      duration_fast,
      duration_slow,
      difficulty,
      length,
      image,
      gpx_file,
      liked,
      likes_count,
      gpx_data,
      const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      __$$RouteImplCopyWithImpl<_$RouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteImplToJson(
      this,
    );
  }
}

abstract class _Route extends Route {
  const factory _Route(
      {required final String url,
      required final int pk,
      required final String name,
      required final String description,
      required final City city,
      required final String duration_fast,
      required final String duration_slow,
      required final int difficulty,
      required final int length,
      required final String image,
      final String? gpx_file,
      required final bool liked,
      required final int likes_count,
      final GpxData? gpx_data,
      final List<Place>? places}) = _$RouteImpl;
  const _Route._() : super._();

  factory _Route.fromJson(Map<String, dynamic> json) = _$RouteImpl.fromJson;

  @override
  String get url;
  @override
  int get pk;
  @override
  String get name;
  @override
  String get description;
  @override
  City get city;
  @override
  String get duration_fast;
  @override
  String get duration_slow;
  @override
  int get difficulty;
  @override
  int get length;
  @override
  String get image;
  @override
  String? get gpx_file;
  @override
  bool get liked;
  @override
  int get likes_count;
  @override
  GpxData? get gpx_data;
  @override
  List<Place>? get places;
  @override
  @JsonKey(ignore: true)
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
