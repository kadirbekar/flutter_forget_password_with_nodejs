import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.mail,
    required this.password,
  });

  final String mail;
  final String password;

  factory UserModel.fromJson(Map<String, Object> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
