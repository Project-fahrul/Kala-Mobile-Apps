import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_model.freezed.dart';
part 'password_model.g.dart';

@freezed
class PasswordModel with _$PasswordModel {
  factory PasswordModel({required int status, required String error}) =
      _PasswordModel;

  factory PasswordModel.fromJson(Map<String, Object?> json) =>
      _$PasswordModelFromJson(json);
}
