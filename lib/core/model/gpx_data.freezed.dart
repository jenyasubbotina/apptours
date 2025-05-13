// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gpx_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GpxData _$GpxDataFromJson(Map<String, dynamic> json) {
  return _GpxData.fromJson(json);
}

/// @nodoc
mixin _$GpxData {
  List<Track> get tracks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GpxDataCopyWith<GpxData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GpxDataCopyWith<$Res> {
  factory $GpxDataCopyWith(GpxData value, $Res Function(GpxData) then) =
      _$GpxDataCopyWithImpl<$Res, GpxData>;
  @useResult
  $Res call({List<Track> tracks});
}

/// @nodoc
class _$GpxDataCopyWithImpl<$Res, $Val extends GpxData>
    implements $GpxDataCopyWith<$Res> {
  _$GpxDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GpxDataImplCopyWith<$Res> implements $GpxDataCopyWith<$Res> {
  factory _$$GpxDataImplCopyWith(
          _$GpxDataImpl value, $Res Function(_$GpxDataImpl) then) =
      __$$GpxDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Track> tracks});
}

/// @nodoc
class __$$GpxDataImplCopyWithImpl<$Res>
    extends _$GpxDataCopyWithImpl<$Res, _$GpxDataImpl>
    implements _$$GpxDataImplCopyWith<$Res> {
  __$$GpxDataImplCopyWithImpl(
      _$GpxDataImpl _value, $Res Function(_$GpxDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$GpxDataImpl(
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GpxDataImpl extends _GpxData with DiagnosticableTreeMixin {
  const _$GpxDataImpl({required final List<Track> tracks})
      : _tracks = tracks,
        super._();

  factory _$GpxDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GpxDataImplFromJson(json);

  final List<Track> _tracks;
  @override
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GpxData(tracks: $tracks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GpxData'))
      ..add(DiagnosticsProperty('tracks', tracks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpxDataImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tracks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GpxDataImplCopyWith<_$GpxDataImpl> get copyWith =>
      __$$GpxDataImplCopyWithImpl<_$GpxDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GpxDataImplToJson(
      this,
    );
  }
}

abstract class _GpxData extends GpxData {
  const factory _GpxData({required final List<Track> tracks}) = _$GpxDataImpl;
  const _GpxData._() : super._();

  factory _GpxData.fromJson(Map<String, dynamic> json) = _$GpxDataImpl.fromJson;

  @override
  List<Track> get tracks;
  @override
  @JsonKey(ignore: true)
  _$$GpxDataImplCopyWith<_$GpxDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
