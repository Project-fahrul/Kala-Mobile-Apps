import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_token_response.freezed.dart';
part 'verify_token_response.g.dart';

@freezed
class VerifyTokenResponse with _$VerifyTokenResponse {
  factory VerifyTokenResponse(
      {required String name,
      required String phoneNumber,
      required String email,
      required int id}) = _VerifyTokenResponse;
  factory VerifyTokenResponse.fromJson(Map<String, Object?> json) =>
      _$VerifyTokenResponseFromJson(json);
}
