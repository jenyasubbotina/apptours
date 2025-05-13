import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_support_data.freezed.dart';
part 'profile_support_data.g.dart';

@freezed
class ProfileSupportData with _$ProfileSupportData {
  const factory ProfileSupportData({
    required String about_text,
    required String support_text,
    required String phone,
    required String email,
  }) = _ProfileSupportData;

  const ProfileSupportData._();

  factory ProfileSupportData.fromJson(Map<String, dynamic> json) => _$ProfileSupportDataFromJson(json);
}
