import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  const ResponseModel({
    this.ok = false,
    this.message,
  });

  final bool ok;
  final String? message;

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResponseModelToJson(this);
  }

  factory ResponseModel.commonErrorMessage() {
    return ResponseModel(
      ok: false,
      message: 'An error occurred during process.',
    );
  }
}
