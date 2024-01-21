import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_model.g.dart';

@JsonSerializable(createFactory: false)
class ForgetPasswordRequestModel {
  const ForgetPasswordRequestModel({
    required this.mail,
  });

  final String mail;

  Map<String, dynamic> toJson () => _$ForgetPasswordRequestModelToJson(this);
}
