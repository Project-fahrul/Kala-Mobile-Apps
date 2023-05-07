import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_response_http.freezed.dart';
part 'list_response_http.g.dart';

@Freezed(
  genericArgumentFactories: true,
  equal: false,
  addImplicitFinal: false,
  makeCollectionsUnmodifiable: false,
)
class ListResponse<T> with _$ListResponse<T> {
  factory ListResponse({required List<T> data}) = _ListResponse<T>;
  factory ListResponse.fromJson(
          Map<String, Object?> json, T Function(Object? json) fromJsonT) =>
      _$ListResponseFromJson<T>(json, fromJsonT);
}
