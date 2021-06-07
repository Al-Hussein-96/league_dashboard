import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Login {
  LoginModel({required String token}) : super(token: token);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
