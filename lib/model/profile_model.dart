import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@unfreezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel(
      {required String name,
      required String phoneNumber,
      required String email}) = _ProfileModel;
}
