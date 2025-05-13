// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_support_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileSupportData _$ProfileSupportDataFromJson(Map<String, dynamic> json) {
  return _ProfileSupportData.fromJson(json);
}

/// @nodoc
mixin _$ProfileSupportData {
  String get about_text => throw _privateConstructorUsedError;
  String get support_text => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileSupportDataCopyWith<ProfileSupportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSupportDataCopyWith<$Res> {
  factory $ProfileSupportDataCopyWith(
          ProfileSupportData value, $Res Function(ProfileSupportData) then) =
      _$ProfileSupportDataCopyWithImpl<$Res, ProfileSupportData>;
  @useResult
  $Res call(
      {String about_text, String support_text, String phone, String email});
}

/// @nodoc
class _$ProfileSupportDataCopyWithImpl<$Res, $Val extends ProfileSupportData>
    implements $ProfileSupportDataCopyWith<$Res> {
  _$ProfileSupportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about_text = null,
    Object? support_text = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      about_text: null == about_text
          ? _value.about_text
          : about_text // ignore: cast_nullable_to_non_nullable
              as String,
      support_text: null == support_text
          ? _value.support_text
          : support_text // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileSupportDataImplCopyWith<$Res>
    implements $ProfileSupportDataCopyWith<$Res> {
  factory _$$ProfileSupportDataImplCopyWith(_$ProfileSupportDataImpl value,
          $Res Function(_$ProfileSupportDataImpl) then) =
      __$$ProfileSupportDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String about_text, String support_text, String phone, String email});
}

/// @nodoc
class __$$ProfileSupportDataImplCopyWithImpl<$Res>
    extends _$ProfileSupportDataCopyWithImpl<$Res, _$ProfileSupportDataImpl>
    implements _$$ProfileSupportDataImplCopyWith<$Res> {
  __$$ProfileSupportDataImplCopyWithImpl(_$ProfileSupportDataImpl _value,
      $Res Function(_$ProfileSupportDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about_text = null,
    Object? support_text = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$ProfileSupportDataImpl(
      about_text: null == about_text
          ? _value.about_text
          : about_text // ignore: cast_nullable_to_non_nullable
              as String,
      support_text: null == support_text
          ? _value.support_text
          : support_text // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSupportDataImpl extends _ProfileSupportData {
  const _$ProfileSupportDataImpl(
      {required this.about_text,
      required this.support_text,
      required this.phone,
      required this.email})
      : super._();

  factory _$ProfileSupportDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSupportDataImplFromJson(json);

  @override
  final String about_text;
  @override
  final String support_text;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'ProfileSupportData(about_text: $about_text, support_text: $support_text, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSupportDataImpl &&
            (identical(other.about_text, about_text) ||
                other.about_text == about_text) &&
            (identical(other.support_text, support_text) ||
                other.support_text == support_text) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, about_text, support_text, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSupportDataImplCopyWith<_$ProfileSupportDataImpl> get copyWith =>
      __$$ProfileSupportDataImplCopyWithImpl<_$ProfileSupportDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSupportDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileSupportData extends ProfileSupportData {
  const factory _ProfileSupportData(
      {required final String about_text,
      required final String support_text,
      required final String phone,
      required final String email}) = _$ProfileSupportDataImpl;
  const _ProfileSupportData._() : super._();

  factory _ProfileSupportData.fromJson(Map<String, dynamic> json) =
      _$ProfileSupportDataImpl.fromJson;

  @override
  String get about_text;
  @override
  String get support_text;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ProfileSupportDataImplCopyWith<_$ProfileSupportDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
