import 'package:freezed_annotation/freezed_annotation.dart';

part 'evidance_model.freezed.dart';
part 'evidance_model.g.dart';

@freezed
class EvidanceModel with _$EvidanceModel {
  const factory EvidanceModel(
      {required String customerName,
      required int customerId,
      required String evidanceType,
      required DateTime deadLine,
      @Default("") String comment,
      @Default("") String content,
      String? pesan,
      required int isUploaded}) = _EvidanceModel;

  factory EvidanceModel.fromJson(Map<String, Object?> json) =>
      _$EvidanceModelFromJson(json);
}