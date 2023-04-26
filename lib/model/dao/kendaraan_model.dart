import 'package:freezed_annotation/freezed_annotation.dart';

part 'kendaraan_model.freezed.dart';
part 'kendaraan_model.g.dart';

@freezed
class KendaraanModel with _$KendaraanModel {
  factory KendaraanModel({required String tipeKendaraan}) = _KendaraanModel;

  factory KendaraanModel.fromJson(Map<String, Object?> json) =>
      _$KendaraanModelFromJson(json);
}
