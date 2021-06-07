// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substadium_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubstadiumModel _$SubstadiumModelFromJson(Map<String, dynamic> json) {
  return SubstadiumModel(
    id: json['id'] as int,
    imageUrl: json['image_url'] as String,
    name: json['name'] as String,
    stadiumId: json['stadium_id'] as int,
  );
}

Map<String, dynamic> _$SubstadiumModelToJson(SubstadiumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'stadium_id': instance.stadiumId,
    };
