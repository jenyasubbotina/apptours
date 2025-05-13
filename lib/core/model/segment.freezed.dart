// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Segment _$SegmentFromJson(Map<String, dynamic> json) {
  return _Segment.fromJson(json);
}

/// @nodoc
mixin _$Segment {
  List<List<double>> get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SegmentCopyWith<Segment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentCopyWith<$Res> {
  factory $SegmentCopyWith(Segment value, $Res Function(Segment) then) =
      _$SegmentCopyWithImpl<$Res, Segment>;
  @useResult
  $Res call({List<List<double>> points});
}

/// @nodoc
class _$SegmentCopyWithImpl<$Res, $Val extends Segment>
    implements $SegmentCopyWith<$Res> {
  _$SegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SegmentImplCopyWith<$Res> implements $SegmentCopyWith<$Res> {
  factory _$$SegmentImplCopyWith(
          _$SegmentImpl value, $Res Function(_$SegmentImpl) then) =
      __$$SegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<double>> points});
}

/// @nodoc
class __$$SegmentImplCopyWithImpl<$Res>
    extends _$SegmentCopyWithImpl<$Res, _$SegmentImpl>
    implements _$$SegmentImplCopyWith<$Res> {
  __$$SegmentImplCopyWithImpl(
      _$SegmentImpl _value, $Res Function(_$SegmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
  }) {
    return _then(_$SegmentImpl(
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SegmentImpl extends _Segment with DiagnosticableTreeMixin {
  const _$SegmentImpl({required final List<List<double>> points})
      : _points = points,
        super._();

  factory _$SegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SegmentImplFromJson(json);

  final List<List<double>> _points;
  @override
  List<List<double>> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Segment(points: $points)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Segment'))
      ..add(DiagnosticsProperty('points', points));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SegmentImpl &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SegmentImplCopyWith<_$SegmentImpl> get copyWith =>
      __$$SegmentImplCopyWithImpl<_$SegmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SegmentImplToJson(
      this,
    );
  }
}

abstract class _Segment extends Segment {
  const factory _Segment({required final List<List<double>> points}) =
      _$SegmentImpl;
  const _Segment._() : super._();

  factory _Segment.fromJson(Map<String, dynamic> json) = _$SegmentImpl.fromJson;

  @override
  List<List<double>> get points;
  @override
  @JsonKey(ignore: true)
  _$$SegmentImplCopyWith<_$SegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
