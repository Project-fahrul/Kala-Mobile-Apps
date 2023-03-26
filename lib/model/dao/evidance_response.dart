import 'dart:ffi';

import 'package:customer_retention/model/evidance_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'evidance_response.freezed.dart';
part 'evidance_response.g.dart';

@freezed
class EvidanceResponse with _$EvidanceResponse {
  const factory EvidanceResponse({
    required List<EvidanceModel> evidances,
    required int progress,
  }) = _EvidanceResponse;

  factory EvidanceResponse.fromJson(Map<String, Object?> json) =>
      _$EvidanceResponseFromJson(json);
}
