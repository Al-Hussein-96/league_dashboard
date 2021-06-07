
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_api.g.dart';

//flutter pub run build_runner
@JsonSerializable()
class ResponseApi extends Equatable {
  final bool success;
  final String data;
  final String message;

  ResponseApi({required this.success,required this.data,required this.message}) : super([success,data,message]);

  factory ResponseApi.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseApiToJson(this);
}
