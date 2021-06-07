// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApi _$ResponseApiFromJson(Map<String, dynamic> json) {
  return ResponseApi(
    success: json['success'] as bool,
    data: json['data'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ResponseApiToJson(ResponseApi instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
